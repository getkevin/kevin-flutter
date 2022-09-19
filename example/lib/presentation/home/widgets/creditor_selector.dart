import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/domain/creditor/creditor.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_progress_indicator.dart';
import 'package:kevin_flutter_example/presentation/home/widgets/creditor_view.dart';

typedef Callback = void Function(Creditor);

class CreditorSelector extends StatelessWidget {
  final bool isLoadingInProgress;
  final List<Creditor> creditors;
  final Creditor? selectedCreditors;
  final Callback onCreditorSelected;

  const CreditorSelector({
    Key? key,
    required this.isLoadingInProgress,
    required this.creditors,
    this.selectedCreditors,
    required this.onCreditorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoadingInProgress) {
      return const SizedBox(
        height: 51.0,
        child: Center(
          child: KevinDemoProgressIndicator(),
        ),
      );
    }

    if (creditors.isEmpty) {
      return const SizedBox(
        height: 51.0,
        child: Text('No charities found for selected country'),
      );
    }

    return SizedBox(
      height: 51.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: creditors.map((e) {
          return Padding(
            padding: EdgeInsets.only(
              right: creditors.last == e ? 0.0 : 16.0,
            ),
            child: CreditorView(
              isSelected: e == selectedCreditors,
              logoUrl: e.logo,
              onTap: () => onCreditorSelected(e),
            ),
          );
        }).toList(),
      ),
    );
  }
}
