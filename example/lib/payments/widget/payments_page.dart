import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_button.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_check_box.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_form_field.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_progress_indicator.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_snack_bar.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_bloc.dart';
import 'package:kevin_flutter_example/payments/model/country_item.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';
import 'package:kevin_flutter_example/web/app_urls.dart';
import 'package:kevin_flutter_example/web/external_url.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

part 'payments_body_widgets.dart';

part 'payments_button_widgets.dart';

part 'payments_country_widgets.dart';

part 'payments_creditors_widgets.dart';

part 'payments_user_input_widgets.dart';

const _creditorItemAspectRatio = 1.92;

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<StatefulWidget> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  late final PaymentsBloc _bloc;

  final _scrollController = ScrollController();

  final _emailController = TextEditingController();
  final _amountController = TextEditingController();
  final _amountFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _bloc = context.read();

    _emailController.addListener(_onEmailChanged);
    _amountController.addListener(_onAmountChanged);
  }

  @override
  void dispose() {
    _emailController.removeListener(_onEmailChanged);
    _amountController.removeListener(_onAmountChanged);

    _emailController.dispose();
    _amountController.dispose();
    _amountFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: BlocConsumer<PaymentsBloc, PaymentsState>(
            listener: (context, state) {
              if (state.openPaymentTypeDialog) {
                _onOpenPaymentTypeDialog(context: context);
              }

              if (state.generalError.isPresent) {
                _onGeneralError(context: context);
              }
            },
            builder: (context, state) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    sliver: SliverToBoxAdapter(
                      child: _Body(
                        state: state,
                        emailController: _emailController,
                        amountController: _amountController,
                        amountFocusNode: _amountFocusNode,
                        onCountryPressed: _onCountryPressed,
                        onCreditorPressed: _onCreditorPressed,
                        onTermsAcceptedChanged: _onTermsAcceptedChanged,
                        onAmountSubmitted: () =>
                            _onValidatePayment(context: context),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    fillOverscroll: true,
                    hasScrollBody: false,
                    child: _AlignedButton(
                      amount: state.amount,
                      onPressed: () => _onValidatePayment(context: context),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onEmailChanged() {
    _bloc.add(SetEmailEvent(email: _emailController.text));
  }

  void _onAmountChanged() {
    _bloc.add(SetAmountEvent(amount: _amountController.text));
  }

  void _onCountryPressed(CountryItem country) {
    // TODO: Open country dialog
    ScaffoldMessenger.of(context).showSnackBar(
      KevinSnackBar.text(
        context: context,
        text: 'Open dialog',
        type: KevinSnackBarType.success,
      ),
    );
  }

  void _onCreditorPressed(CreditorListItem creditor) {
    _bloc.add(SetCreditorEvent(creditor: creditor));
  }

  void _onTermsAcceptedChanged(bool accepted) {
    _bloc.add(SetTermsAcceptedEvent(accepted: accepted));
  }

  void _onValidatePayment({required BuildContext context}) {
    FocusScope.of(context).unfocus();
    _bloc.add(const ValidatePaymentEvent());
  }

  void _onOpenPaymentTypeDialog({required BuildContext context}) {
    _bloc.add(const ClearOpenPaymentTypeDialogEvent());

    // TODO: Should open payment dialog instead
    ScaffoldMessenger.of(context).showSnackBar(
      KevinSnackBar.text(
        context: context,
        text: 'Success',
        type: KevinSnackBarType.success,
      ),
    );
  }

  void _onGeneralError({required BuildContext context}) {
    _bloc.add(const ClearGeneralErrorEvent());

    // TODO: Add proper error handling
    ScaffoldMessenger.of(context).showSnackBar(
      KevinSnackBar.text(context: context, text: 'Error'),
    );
  }
}
