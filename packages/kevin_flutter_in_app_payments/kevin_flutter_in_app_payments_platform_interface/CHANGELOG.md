## 1.2.0

* **BREAKING**: KevinPaymentType was deprecated and removed, only bank payments are accepted
* Upgrade:
    - `kevin_flutter_core: 1.2.0`

## 1.1.0

* Update Dart min version to 3.0.0
* Upgrade:
    - `kevin_flutter_core: 1.1.0`

## 1.0.4

* Upgrade:
    - `kevin_flutter_core: 1.0.6`

## 1.0.3

* Upgrade:
    - `kevin_flutter_core: 1.0.5`

## 1.0.2

* Expose KevinSessionUnexpectedError - wrapper of plugin's native part's unexpected errors (wrong
  initialisation/result parsing errors)
* Make KevinCallbackUrl.single const constructor
* Upgrade:
    - `kevin_flutter_core: 1.0.4`

## 1.0.1

* **BREAKING**: use KevinCallbackUrl in KevinPaymentsConfiguration instead of string
* Add toMap/fromMap() methods to models where needed
* Remove entity classes
* Upgrade:
    - `kevin_flutter_core: 1.0.3`

## 1.0.0

* Initial release.