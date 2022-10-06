import 'package:collection/collection.dart';
import 'package:domain/country/model/country.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

extension ToKevinCountry on Country {
  KevinCountry toKevinCountry({required KevinCountry defaultCountry}) {
    final country = KevinCountry.values
        .firstWhereOrNull((c) => c.iso == code.toLowerCase());

    return country ?? defaultCountry;
  }
}
