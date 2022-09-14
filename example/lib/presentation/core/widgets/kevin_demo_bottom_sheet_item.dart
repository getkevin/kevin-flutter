import 'package:flutter/material.dart';

typedef Callback = void Function();

class KevinDemoBottomSheetItem extends StatelessWidget {
  final String title;
  final Callback onTap;

  const KevinDemoBottomSheetItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      onTap: onTap,
    );
  }
}
