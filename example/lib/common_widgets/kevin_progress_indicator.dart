import 'package:flutter/material.dart';

class KevinProgressIndicator extends StatelessWidget {
  final Widget _child;

  const KevinProgressIndicator({super.key})
      : _child = const CircularProgressIndicator();

  const KevinProgressIndicator.center({super.key})
      : _child = const Center(
          child: KevinProgressIndicator(),
        );

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}
