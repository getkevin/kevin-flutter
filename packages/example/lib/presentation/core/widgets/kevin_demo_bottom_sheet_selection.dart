import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_bottom_sheet_item.dart';

class KevinDemoBottomSheetSelection extends StatelessWidget {
  final List<KevinDemoBottomSheetItem> items;

  const KevinDemoBottomSheetSelection({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...items,
      ],
    );
  }
}
