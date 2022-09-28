import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String id;

  const Payment({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
