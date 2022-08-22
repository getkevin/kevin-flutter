import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/presentation/core/text_styles.dart';

typedef Callback = void Function();

class KevinDemoButton extends StatelessWidget {
  final bool isEnabled;
  final double height;
  final double padding;
  final String title;
  final Callback onTap;

  const KevinDemoButton({
    Key? key,
    this.isEnabled = true,
    this.height = 48.0,
    this.padding = 8.0,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: MaterialButton(
        height: height,
        minWidth: double.maxFinite,
        color: isEnabled ? const Color(0xff5d80fe) : const Color(0xff7c8894),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textColor: Colors.white,
        onPressed: () {
          if (!isEnabled) {
            return;
          }

          onTap();
        },
        child: Text(
          title.toUpperCase(),
          style: buttonTitle,
        ),
      ),
    );
  }
}
