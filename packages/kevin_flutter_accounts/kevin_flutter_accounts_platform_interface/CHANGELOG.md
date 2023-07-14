## 1.2.0

* **BREAKING**: KevinAccountLinkingType was deprecated and removed, only bank linking is accepted
* Upgrade:
    - `kevin_flutter_core: 1.2.0`

## 1.1.0

* Update Dart min version to 3.0.0
* Upgrade:
    - `kevin_flutter_core: 1.1.0`

## 1.0.5

* Upgrade:
    - `kevin_flutter_core: 1.0.6`

## 1.0.4

* Upgrade:
    - `kevin_flutter_core: 1.0.5`

## 1.0.3

* Expose KevinSessionUnexpectedError - wrapper of plugin's native part's unexpected errors (wrong
  initialisation/result parsing errors)
* Make KevinCallbackUrl.single const constructor
* Upgrade:
    - `kevin_flutter_core: 1.0.4`

## 1.0.2

* **BREAKING**: rename disabledCountrySelection to disableCountrySelection in
  KevinAccountSessionConfiguration
* **BREAKING**: use KevinCallbackUrl in KevinAccountsConfiguration instead of string
* Add toMap/fromMap() methods to models where needed
* Introduce KevinFlutterAccountsMethods for internal usage
* Remove entity classes
* Upgrade:
    - `kevin_flutter_core: 1.0.3`

## 1.0.1

* Fix KevinAccountSessionConfigurationEntity.fromModel() method

## 1.0.0

* Initial release.