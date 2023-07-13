## 1.2.0

* **BREAKING**: KevinPaymentType was deprecated and removed, only bank payments are accepted
* Upgrade:
    - `kevin_flutter_in_app_payments_ios: 1.2.0`
    - `kevin_flutter_in_app_payments_android: 1.2.0`
    - `kevin_flutter_in_app_payments_platform_interface: 1.2.0`
    - `kevin_flutter_core: 1.2.0`

## 1.1.0

* Update Dart min version to 3.0.0
* Upgrade:
    - `kevin_flutter_in_app_payments_ios: 1.1.0`
    - `kevin_flutter_in_app_payments_android: 1.1.0`
    - `kevin_flutter_in_app_payments_platform_interface: 1.1.0`
    - `kevin_flutter_core: 1.1.0`

## 1.0.5

* Upgrade:
    - `kevin_flutter_in_app_payments_ios: 1.0.4`
    - `kevin_flutter_in_app_payments_android: 1.0.3`
    - `kevin_flutter_in_app_payments_platform_interface: 1.0.4`
    - `kevin_flutter_core: 1.0.6`

## 1.0.4

* iOS: Make SDK modal sheet non-dismissible on iOS >= 13
* Upgrade:
    - `kevin_flutter_in_app_payments_ios: 1.0.3`
    - `kevin_flutter_in_app_payments_android: 1.0.2`
    - `kevin_flutter_in_app_payments_platform_interface: 1.0.3`
    - `kevin_flutter_core: 1.0.5`

## 1.0.3

* Expose KevinSessionUnexpectedError - wrapper of plugin's native part's unexpected errors (wrong
  initialisation/result parsing errors)
* Make KevinCallbackUrl.single const constructor
* Upgrade:
    - `kevin_flutter_in_app_payments_platform_interface: 1.0.2`
    - `kevin_flutter_in_app_payments_ios: 1.0.2`
    - `kevin_flutter_in_app_payments_android: 1.0.1`

## 1.0.2

* **FIX**: iOS skipBankSelection functionality fixed
* Upgrade:
    - `kevin_flutter_in_app_payments_ios: 1.0.1`

## 1.0.1

* **BREAKING**: use KevinCallbackUrl in KevinPaymentsConfiguration instead of string
* Add:
    - `kevin_flutter_in_app_payments_android: 1.0.0`
    - `kevin_flutter_in_app_payments_ios: 1.0.0`
* Upgrade:
    - `kevin_flutter_core: 1.0.3`
    - `kevin_flutter_in_app_payments_platform_interface: 1.0.1`

## 1.0.0

* Initial release.