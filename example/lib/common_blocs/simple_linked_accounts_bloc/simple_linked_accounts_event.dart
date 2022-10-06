import 'package:equatable/equatable.dart';

abstract class SimpleLinkedAccountsEvent extends Equatable {
  const SimpleLinkedAccountsEvent();

  @override
  List<Object?> get props => [];
}

class LoadLinkedAccountsEvent extends SimpleLinkedAccountsEvent {
  const LoadLinkedAccountsEvent();
}
