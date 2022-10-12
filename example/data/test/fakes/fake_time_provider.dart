import 'package:domain/time/time_provider.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeTimeProvider extends Fake implements TimeProvider {
  var _now = DateTime.utc(2022);

  @override
  DateTime now() => _now;

  void setTime({required DateTime dateTime}) {
    _now = dateTime;
  }
}
