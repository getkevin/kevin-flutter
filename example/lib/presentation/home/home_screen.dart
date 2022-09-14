import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/application/payment_bloc.dart';
import 'package:kevin_flutter_example/domain/creditor/creditor.dart';
import 'package:kevin_flutter_example/presentation/core/country_name_helper.dart';
import 'package:kevin_flutter_example/presentation/core/text_styles.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_bottom_sheet_item.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_bottom_sheet_selection.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_button.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_list_section.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_text_field.dart';
import 'package:kevin_flutter_example/presentation/home/widgets/country_row.dart';
import 'package:kevin_flutter_example/presentation/home/widgets/creditor_selector.dart';
import 'package:kevin_flutter_example/presentation/home/widgets/payment_type_selector.dart';
import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<KevinPaymentType> _paymentOptions = [
    KevinPaymentType.bank,
    KevinPaymentType.card,
  ];
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _paymentOptions.length, vsync: this);
    _tabController?.addListener(_onPaymentTypeSelected);

    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  void _onPaymentTypeSelected() {
    context.read<PaymentBloc>().add(
          PaymentEvent.paymentTypeSelected(
            paymentType: _paymentOptions[_tabController!.index],
          ),
        );
  }

  void _onCountrySelectorPressed(
    List<String> countryList,
    BuildContext context,
  ) {
    final items = countryList.map((e) {
      return KevinDemoBottomSheetItem(
        title: getNameForCountryCode(e),
        onTap: () => _onCountrySelected(e, context),
      );
    }).toList();

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      builder: (BuildContext context) {
        return KevinDemoBottomSheetSelection(
          items: items,
        );
      },
    );
  }

  void _onCountrySelected(String countryCode, BuildContext context) {
    Navigator.pop(context);
    context.read<PaymentBloc>().add(
          PaymentEvent.countrySelected(countryCode: countryCode),
        );
  }

  void _onCreditorSelected(Creditor creditor, BuildContext context) {
    context.read<PaymentBloc>().add(
          PaymentEvent.creditorSelected(creditor: creditor),
        );
  }

  void _onPrivacyCheckmarkChanged(bool? value) {
    context.read<PaymentBloc>().add(
          PaymentEvent.privacyAgreementUpdated(
            isAccepted: value ?? false,
          ),
        );
  }

  bool _isDonateButtonEnabled(PaymentState state) {
    return state.isPrivacyPolicyAccepted &&
        state.amount > 0 &&
        state.email.isNotEmpty &&
        state.selectedCreditor != null;
  }

  void _onDonateButtonTapped() {
    context.read<PaymentBloc>().add(
          const PaymentEvent.initiateDonation(),
        );
  }

  Future _presentAlert({
    required String message,
    bool isSuccess = true,
    required BuildContext context,
  }) {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(isSuccess ? 'Success' : 'Error'),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      );
    }

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isSuccess ? 'Success!' : 'Error!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl({
    required String url,
  }) async {
    await canLaunchUrlString(url) ? await launchUrlString(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff2f2f7),
        body: BlocConsumer<PaymentBloc, PaymentState>(
          listenWhen: (previousState, currentState) {
            return previousState.showError != currentState.showError ||
                previousState.sdkSuccess != currentState.sdkSuccess;
          },
          listener: (context, state) {
            if (state.showError && state.errorMessage != null) {
              _presentAlert(
                message: state.errorMessage!,
                isSuccess: false,
                context: context,
              );
            } else if (state.sdkSuccess) {
              _presentAlert(
                message: 'Donation was successful',
                isSuccess: true,
                context: context,
              );

              context.read<PaymentBloc>().add(
                    const PaymentEvent.successPresented(),
                  );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        'Redirect payment',
                        style: screenTitle,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        'Pick a charity you want to donate to',
                        style: screenSubtitle,
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      PaymentTypeSelector(
                        options: _paymentOptions,
                        controller: _tabController!,
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      KevinDemoListSection(
                        title: 'Select country and charity',
                        content: Column(
                          children: [
                            const SizedBox(
                              height: 13.0,
                            ),
                            CountryRow(
                              selectedCountry: getNameForCountryCode(
                                state.selectedCountryCode,
                              ),
                              onTap: () {
                                _onCountrySelectorPressed(
                                  state.countryList,
                                  context,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            CreditorSelector(
                              isLoadingInProgress:
                                  state.isCharityRequestInProgress,
                              creditors: state.creditors,
                              selectedCreditors: state.selectedCreditor,
                              onCreditorSelected: (creditor) {
                                _onCreditorSelected(creditor, context);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 37.0,
                      ),
                      KevinDemoListSection(
                        title: 'Enter details',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 27.0,
                            ),
                            const Text(
                              'E-mail',
                              style: textFieldTitle,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            KevinDemoTextField(
                              controller: state.emailController,
                              focusNode: state.emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 26.0,
                            ),
                            const Text(
                              'Payment amount',
                              style: textFieldTitle,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                KevinDemoTextField(
                                  controller: state.amountController,
                                  focusNode: state.amountFocusNode,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(RegExp(r'\s\b|\b\s')),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Text(
                                    'EUR',
                                    style: amountCurrency,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: state.isPrivacyPolicyAccepted,
                            onChanged: _onPrivacyCheckmarkChanged,
                            fillColor: MaterialStateProperty.all(
                              const Color(0xff5d80fe),
                            ),
                          ),
                          Flexible(
                            child: StyledText(
                              text:
                                  'I have read and agree with <linkTerms>Terms & Conditions</linkTerms> and <linkPrivacy>Privacy Policy</linkPrivacy>',
                              softWrap: true,
                              style: checkboxText,
                              tags: {
                                'linkTerms': StyledTextActionTag(
                                  (String? text, Map<String?, String?> attrs) =>
                                      _launchUrl(
                                    url:
                                        'https://www.kevin.eu/docs/EN/terms-and-conditions/',
                                  ),
                                  style: checkboxText.copyWith(
                                    color: const Color(0xff5d80fe),
                                  ),
                                ),
                                'linkPrivacy': StyledTextActionTag(
                                  (String? text, Map<String?, String?> attrs) =>
                                      _launchUrl(
                                    url:
                                        'https://www.kevin.eu/docs/EN/privacy-policy/',
                                  ),
                                  style: checkboxText.copyWith(
                                    color: const Color(0xff5d80fe),
                                  ),
                                ),
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      KevinDemoButton(
                        isEnabled: _isDonateButtonEnabled(state),
                        title:
                            'Donate • ${state.amount.toStringAsFixed(2)} EUR',
                        onTap: _onDonateButtonTapped,
                        padding: 0.0,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
