import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/presentation/core/text_styles.dart';

class KevinDemoListSection extends StatelessWidget {
  final String title;
  final Widget content;

  const KevinDemoListSection({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: sectionTitle,
        ),
        content,
      ],
    );
  }
}
