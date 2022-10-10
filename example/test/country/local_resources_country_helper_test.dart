import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_example/country/local_resources_country_helper.dart';

void main() {
  EquatableConfig.stringify = true;

  late LocalResourcesCountryHelper subject;

  setUp(() {
    subject = LocalResourcesCountryHelper();
  });

  test('Default flag key test', () {
    final result = subject.getFlagKey('countryCode');

    expect(result, 'resources/flags/flag_eu.svg');
  });

  test('Default name test', () {
    final result = subject.getNameKey('countryCode');

    expect(result, 'countryCode');
  });

  test('Get supported countries flag keys test', () {
    final supportedCountries = subject.getSupportedCountryCodes();

    final expectedResult = supportedCountries
        .map((code) => 'resources/flags/flag_$code.svg')
        .toList();

    final result =
        supportedCountries.map((code) => subject.getFlagKey(code)).toList();

    expect(result, expectedResult);
  });

  test('Get supported countries name keys test', () {
    final supportedCountries = subject.getSupportedCountryCodes();

    final expectedResult =
        supportedCountries.map((code) => 'country_$code').toList();

    final result =
        supportedCountries.map((code) => subject.getNameKey(code)).toList();

    expect(result, expectedResult);
  });
}
