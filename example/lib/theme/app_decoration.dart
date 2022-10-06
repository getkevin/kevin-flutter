import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AppDecoration extends Equatable {
  final duration = const _Duration();
  final animationCurve = const _AnimationCurve();

  const AppDecoration();

  @override
  List<Object?> get props => [duration, animationCurve];
}

class _Duration extends Equatable {
  final Duration defaultDuration = const Duration(milliseconds: 150);

  const _Duration();

  @override
  List<Object?> get props => [defaultDuration];
}

class _AnimationCurve extends Equatable {
  final Curve defaultCurve = Curves.easeOutCubic;

  const _AnimationCurve();

  @override
  List<Object?> get props => [defaultCurve];
}
