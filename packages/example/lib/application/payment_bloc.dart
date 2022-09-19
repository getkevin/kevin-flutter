import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/domain/creditor/creditor.dart';
import 'package:kevin_flutter_example/domain/i_api_repository.dart';
import 'package:kevin_flutter_example/domain/payment_initialization_state/payment_initialization_state.dart';
import 'package:kevin_flutter_example/domain/repository_failure/repository_failure.dart';
import 'package:kevin_flutter_in_app_payments/kevin_payments.dart';

part 'payment_bloc.freezed.dart';
part 'payment_event.dart';
part 'payment_state.dart';

@lazySingleton
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final IApiRepository _apiRepository;

  PaymentBloc(
    this._apiRepository,
  ) : super(
          PaymentState.initial(
            emailController: TextEditingController(),
            amountController: TextEditingController(),
            emailFocusNode: FocusNode(),
            amountFocusNode: FocusNode(),
          ),
        ) {
    state.emailController.addListener(_onEmailChanged);
    state.amountController.addListener(_onAmountChanged);
  }

  void _onEmailChanged() {
    add(
      PaymentEvent.emailUpdated(
        email: state.emailController.text,
      ),
    );
  }

  void _onAmountChanged() {
    add(
      PaymentEvent.amountUpdated(
        amount: state.amountController.text.isNotEmpty
            ? double.parse(state.amountController.text)
            : 0.00,
      ),
    );
  }

  @override
  Future<void> close() {
    state.emailController.dispose();
    state.amountController.dispose();

    return super.close();
  }

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    yield* event.map(
      loadInitiated: (_) async* {
        var _state = state;

        yield _state.copyWith(
          isCountryRequestInProgress: true,
          isCharityRequestInProgress: true,
        );

        final countryListResult = await _apiRepository.getCountryList();

        _state = countryListResult.fold(
          (error) {
            return _state.copyWith(
              isCountryRequestInProgress: false,
              isCharityRequestInProgress: false,
              showError: true,
              errorMessage: error.getErrorMessage(),
            );
          },
          (countryList) {
            return _state.copyWith(
              isCountryRequestInProgress: false,
              showError: false,
              countryList: countryList,
              selectedCountryCode: 'lt',
            );
          },
        );

        yield _state;

        if (countryListResult.isRight()) {
          final creditorsListResult = await _apiRepository.getCreditors(
            forCountryCode: 'lt',
          );

          _state = creditorsListResult.fold(
            (error) {
              return _state.copyWith(
                isCharityRequestInProgress: false,
                showError: true,
                errorMessage: error.getErrorMessage(),
              );
            },
            (creditorsList) {
              return _state.copyWith(
                isCharityRequestInProgress: false,
                showError: false,
                creditors: creditorsList,
                selectedCreditor:
                    creditorsList.isNotEmpty ? creditorsList.first : null,
              );
            },
          );
        }

        yield _state;
      },
      paymentTypeSelected: (PaymentTypeSelected value) async* {
        yield state.copyWith(
          selectedPaymentType: value.paymentType,
        );
      },
      countrySelected: (PaymentCountrySelected value) async* {
        var _state = state;

        yield _state.copyWith(
          isCharityRequestInProgress: true,
          selectedCountryCode: value.countryCode,
          creditors: [],
          selectedCreditor: null,
        );

        final creditorsListResult = await _apiRepository.getCreditors(
          forCountryCode: value.countryCode,
        );

        _state = creditorsListResult.fold(
          (error) {
            return state.copyWith(
              isCharityRequestInProgress: false,
              showError: true,
              errorMessage: error.getErrorMessage(),
            );
          },
          (creditorsList) {
            return state.copyWith(
              isCharityRequestInProgress: false,
              showError: false,
              creditors: creditorsList,
              selectedCreditor:
                  creditorsList.isNotEmpty ? creditorsList.first : null,
            );
          },
        );

        yield _state;
      },
      creditorSelected: (PaymentCreditorSelected value) async* {
        yield state.copyWith(
          selectedCreditor: value.creditor,
        );
      },
      emailUpdated: (EmailUpdated value) async* {
        yield state.copyWith(
          email: value.email,
        );
      },
      amountUpdated: (AmountUpdated value) async* {
        yield state.copyWith(
          amount: value.amount,
        );
      },
      privacyAgreementUpdated: (PrivacyAgreementUpdated value) async* {
        yield state.copyWith(
          isPrivacyPolicyAccepted: value.isAccepted,
        );
      },
      initiateDonation: (_) async* {
        state.emailFocusNode.unfocus();
        state.amountFocusNode.unfocus();

        late Either<RepositoryFailure, PaymentInitializationState>
            initializationResult;
        if (state.selectedPaymentType == KevinPaymentType.bank) {
          initializationResult = await _apiRepository.initializeBankPayment(
            amount: state.amount.toStringAsFixed(2),
            email: state.email,
            iban: state.selectedCreditor?.accounts.firstOrNull?.iban ?? '',
            creditorName: state.selectedCreditor!.name,
            redirectUrl: await KevinPayments.instance.getCallbackUrl(),
          );
        } else {
          initializationResult = await _apiRepository.initializeCardPayment(
            amount: state.amount.toStringAsFixed(2),
            email: state.email,
            iban: state.selectedCreditor?.accounts.firstOrNull?.iban ?? '',
            creditorName: state.selectedCreditor!.name,
            redirectUrl: await KevinPayments.instance.getCallbackUrl(),
          );
        }

        yield await initializationResult.fold(
          (error) {
            return state.copyWith(
              showError: true,
              errorMessage: error.getErrorMessage(),
            );
          },
          (paymentState) async {
            final sdkCallResult = await KevinPayments.instance.startPayment(
              KevinPaymentSessionConfiguration(
                paymentId: paymentState.id,
                paymentType: state.selectedPaymentType,
              ),
            );

            if (sdkCallResult is KevinSessionResultGeneralError) {
              return state.copyWith(
                showError: true,
                errorMessage: sdkCallResult.message,
              );
            } else if (sdkCallResult is KevinSessionResultPaymentSuccess) {
              state.emailController.text = '';
              state.amountController.text = '';

              return state.copyWith(
                selectedCountryCode: 'LT',
                selectedCreditor: null,
                email: '',
                amount: 0.0,
                isPrivacyPolicyAccepted: false,
                showError: false,
                errorMessage: null,
                sdkSuccess: true,
              );
            }

            return state;
          },
        );
      },
      successPresented: (SuccessPresented value) async* {
        yield state.copyWith(
          sdkSuccess: false,
        );
      },
    );
  }
}
