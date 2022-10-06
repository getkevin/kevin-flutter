import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/kevin/model/auth_scope.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_accounts/kevin_flutter_accounts.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/accounts/account_action/widget/account_action_bottom_dialog.dart';
import 'package:kevin_flutter_example/accounts/bloc/accounts_bloc.dart';
import 'package:kevin_flutter_example/accounts/bloc/accounts_event.dart';
import 'package:kevin_flutter_example/accounts/bloc/accounts_state.dart';
import 'package:kevin_flutter_example/accounts/model/linking_session.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_bottom_sheet.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_button.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_icon_button.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_item.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_snack_bar.dart';
import 'package:kevin_flutter_example/error/api_error_mapper.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

part 'accounts_empty_state.dart';

part 'accounts_header.dart';

class AccountsPage extends StatefulWidget {
  final Function(bool) _onSetGlobalLoading;

  const AccountsPage({
    super.key,
    required Function(bool) onSetGlobalLoading,
  }) : _onSetGlobalLoading = onSetGlobalLoading;

  @override
  State<StatefulWidget> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage>
    with WidgetsBindingObserver {
  late final AccountsBloc _bloc;
  late final ApiErrorMapper _apiErrorMapper;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _bloc = context.read();
    _apiErrorMapper = context.read();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _bloc.add(const ObserveLinkedAccountsEvent(observe: true));
    } else if (state == AppLifecycleState.paused) {
      _bloc.add(const ObserveLinkedAccountsEvent(observe: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AccountsBloc, AccountsState>(
          listener: (context, state) {
            final generalError = state.generalError.orNull;
            if (generalError != null) {
              _onGeneralError(context: context, error: generalError);
            }

            final initializeLinkingResult =
                state.initializeLinkingResult.orNull;
            if (initializeLinkingResult != null) {
              _onInitializeLinkingResult(
                context: context,
                linkingSession: initializeLinkingResult,
              );
            }

            _onInitializeLinkingLoading(
              loading: state.initializeLinkingLoading,
            );
          },
          builder: (context, state) {
            if (state.accounts.isEmpty) {
              return _AccountsEmptyState(
                onLinkAccountPressed: _onInitializeLinking,
              );
            }

            return Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AccountsHeader(onLinkAccountPressed: _onInitializeLinking),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final account = state.accounts[index];

                        var type = KevinListItemType.middle;

                        if (state.accounts.length == 1) {
                          type = KevinListItemType.single;
                        } else if (index == 0) {
                          type = KevinListItemType.top;
                        } else if (index == state.accounts.length - 1) {
                          type = KevinListItemType.bottom;
                        }

                        return KevinListItem(
                          centerWidget:
                              KevinListItemCenterText(text: account.bankName),
                          leadingWidget: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border:
                                  Border.all(color: color.inputUnfocusedBorder),
                            ),
                            child: Image.network(account.logoUrl),
                          ),
                          trailingWidget: Center(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAlias,
                              child: KevinIconButton(
                                onPressed: () => _onOpenAccountAction(
                                  context: context,
                                  account: account,
                                ),
                                icon: AppImages.dots,
                                iconColor: color.primary,
                              ),
                            ),
                          ),
                          type: type,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 1,
                          color: color.inputUnfocusedBorder,
                        );
                      },
                      itemCount: state.accounts.length,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onInitializeLinking() async {
    _bloc.add(
      InitializeLinkingEvent(
        authScopes: const [AuthScope.accountsBasic, AuthScope.payments],
        redirectUrl: await KevinAccounts.getCallbackUrl(),
      ),
    );
  }

  void _onInitializeLinkingLoading({required bool loading}) {
    widget._onSetGlobalLoading.call(loading);
  }

  void _onInitializeLinkingResult({
    required BuildContext context,
    required LinkingSession linkingSession,
  }) async {
    _bloc.add(const ClearInitializeLinkingResultEvent());

    final result = await KevinAccounts.startAccountLinking(
      KevinAccountSessionConfiguration(
        state: linkingSession.state.state,
        preselectedCountry: linkingSession.preselectedCountry,
        disableCountrySelection: linkingSession.disableCountrySelection,
      ),
    );

    if (result is KevinSessionResultLinkingSuccess) {
      _bloc.add(SetLinkingSuccessResultEvent(result: result));
    } else if (result is KevinSessionResultGeneralError) {
      _showError(
        context: context,
        error: result.message ?? LocaleKeys.general_error_unknown.tr(),
      );
    }
  }

  void _onOpenAccountAction({
    required BuildContext context,
    required LinkedAccount account,
  }) async {
    final result = await showKevinBottomSheet<AccountAction>(
      context: context,
      builder: (context, sc) => AccountActionBottomDialog(account: account),
    );

    if (result == AccountAction.delete) {
      _bloc.add(RemoveLinkedAccountEvent(account: account));
    }
  }

  void _onGeneralError({
    required BuildContext context,
    required Exception error,
  }) {
    _bloc.add(const ClearGeneralErrorEvent());

    _showError(context: context, error: _apiErrorMapper.map(error));
  }

  void _showError({
    required BuildContext context,
    required String error,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      KevinSnackBar.text(
        context: context,
        text: error,
      ),
    );
  }
}
