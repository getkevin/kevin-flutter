import 'package:domain/accounts/model/linked_account.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_bloc.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_event.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_state.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_bottom_dialog.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_list_item.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class AccountSelectionBottomDialog extends StatefulWidget {
  final ScrollController _scrollController;

  const AccountSelectionBottomDialog({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  @override
  State<StatefulWidget> createState() => _AccountSelectionBottomDialogState();

  static Widget withBloc({required ScrollController scrollController}) =>
      BlocProvider(
        create: (context) =>
            LinkedAccountsBloc(accountsRepository: context.read())
              ..add(const LoadLinkedAccountsEvent()),
        child: AccountSelectionBottomDialog(scrollController: scrollController),
      );
}

class _AccountSelectionBottomDialogState
    extends State<AccountSelectionBottomDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return BlocBuilder<LinkedAccountsBloc, LinkedAccountsState>(
      builder: (context, state) {
        return KevinListBottomDialog(
          title: LocaleKeys.account_selection_dialog_title.tr(),
          itemCount: state.accounts.length,
          scrollController: widget._scrollController,
          physics: const ClampingScrollPhysics(),
          // shrinkWrap is expensive and not needed when content
          // is large enough to cover a whole screen.
          shrinkWrap: state.accounts.length <= 12,
          builder: (context, index) {
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
              centerWidget: KevinListItemCenterText(text: account.bankName),
              leadingWidget: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: color.inputUnfocusedBorder),
                ),
                child: Image.network(account.logoUrl),
              ),
              trailingWidget: const KevinListItemTrailingArrow(),
              type: type,
              onPressed: () =>
                  _onAccountSelected(context: context, account: account),
            );
          },
        );
      },
    );
  }

  void _onAccountSelected({
    required BuildContext context,
    required LinkedAccount account,
  }) {
    Navigator.of(context).pop(account);
  }
}
