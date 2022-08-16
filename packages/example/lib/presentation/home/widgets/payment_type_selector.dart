import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/domain/payment_type.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_tab_indicator.dart';

class PaymentTypeSelector extends StatelessWidget {
  final List<PaymentType> options;
  final TabController controller;

  const PaymentTypeSelector({
    Key? key,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: TabBar(
          controller: controller,
          labelPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          labelStyle: const TextStyle(fontSize: 15),
          labelColor: Colors.black,
          unselectedLabelColor: const Color(0xff818c99),
          tabs:
              options.map((option) => Tab(text: option.getTabName())).toList(),
          indicator: const KevinDemoTabIndicator(
            indicatorHeight: 2.0,
            indicatorColor: Color(0xff5d80fe),
            indicatorRoundingRadius: 2.0,
          ),
        ),
      ),
    );
  }
}
