import 'package:equatable/equatable.dart';

abstract class LinkedAccountsEvent extends Equatable {
  const LinkedAccountsEvent();

  @override
  List<Object?> get props => [];
}

class LoadLinkedAccountsEvent extends LinkedAccountsEvent {
  const LoadLinkedAccountsEvent();
}
