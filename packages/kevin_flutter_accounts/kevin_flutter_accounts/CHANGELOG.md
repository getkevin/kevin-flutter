## 1.2.0

* **BREAKING**: KevinAccountLinkingType was deprecated and removed, only bank linking is accepted
* Upgrade:
    - `kevin_flutter_accounts_ios: 1.2.0`
    - `kevin_flutter_accounts_android: 1.2.0`
    - `kevin_flutter_accounts_platform_interface: 1.2.0`
    - `kevin_flutter_core: 1.2.0`

## 1.1.0

* Update Dart min version to 3.0.0
* Upgrade:
    - `kevin_flutter_accounts_ios: 1.1.0`
    - `kevin_flutter_accounts_android: 1.1.0`
    - `kevin_flutter_accounts_platform_interface: 1.1.0`
    - `kevin_flutter_core: 1.1.0`

## 1.0.5

* Upgrade:
    - `kevin_flutter_accounts_ios: 1.0.3`
    - `kevin_flutter_accounts_android: 1.0.3`
    - `kevin_flutter_accounts_platform_interface: 1.0.5`
    - `kevin_flutter_core: 1.0.6`

## 1.0.4

* iOS: Make SDK modal sheet non-dismissible on iOS >= 13
* Upgrade:
    - `kevin_flutter_accounts_ios: 1.0.2`
    - `kevin_flutter_accounts_android: 1.0.2`
    - `kevin_flutter_accounts_platform_interface: 1.0.4`
    - `kevin_flutter_core: 1.0.5`

## 1.0.3

* Expose KevinSessionUnexpectedError - wrapper of plugin's native part's unexpected errors (wrong
  initialisation/result parsing errors)
* Make KevinCallbackUrl.single const constructor
* Upgrade:
    - `kevin_flutter_core: 1.0.4`
    - `kevin_flutter_accounts_android: 1.0.1`
    - `kevin_flutter_accounts_ios: 1.0.1`

## 1.0.2

* **BREAKING**: rename disabledCountrySelection to disableCountrySelection in
  KevinAccountSessionConfiguration
* **BREAKING**: use KevinCallbackUrl in KevinAccountsConfiguration instead of string
* Add:
    - `kevin_flutter_accounts_android: 1.0.1`
    - `kevin_flutter_accounts_ios: 1.0.0`
* Upgrade:
    - `kevin_flutter_core: 1.0.3`
    - `kevin_flutter_accounts_platform_interface: 1.0.2`

## 1.0.1

* Upgrade:
    - `kevin_flutter_accounts_platform_interface: 1.0.1`

## 1.0.0

* Initial release.