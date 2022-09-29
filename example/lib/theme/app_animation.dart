import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AppAnimation extends Equatable {
  final duration = const AppAnimationDuration();
  final animationCurve = const AppAnimationCurve();

  const AppAnimation();

  @override
  List<Object?> get props => [duration, animationCurve];
}

class AppAnimationDuration extends Equatable {
  final Duration defaultDuration = const Duration(milliseconds: 150);
  final Duration longDuration = const Duration(milliseconds: 300);
  final Duration shortDuration = const Duration(milliseconds: 50);

  const AppAnimationDuration();

  @override
  List<Object?> get props => [defaultDuration];
}

class AppAnimationCurve extends Equatable {
  final Curve defaultCurve = Curves.easeOutCubic;

  const AppAnimationCurve();

  @override
  List<Object?> get props => [defaultCurve];
}
