import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KevinDemoProgressIndicator extends StatelessWidget {
  const KevinDemoProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator();
    } else {
      return const CircularProgressIndicator();
    }
  }
}
