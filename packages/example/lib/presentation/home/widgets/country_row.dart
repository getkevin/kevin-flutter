import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/presentation/core/text_styles.dart';
import 'package:kevin_flutter_example/presentation/core/widgets/kevin_demo_progress_indicator.dart';

typedef Callback = void Function();

class CountryRow extends StatelessWidget {
  final String selectedCountry;
  final Callback onTap;

  const CountryRow({
    Key? key,
    required this.selectedCountry,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Text(
              'Country',
              style: countryRowTitle,
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            if (selectedCountry.isEmpty)
              const KevinDemoProgressIndicator()
            else
              Text(
                selectedCountry,
                style: countryRowTitle,
              ),
            SvgPicture.asset('assets/icons/chevron.svg'),
          ],
        ),
      ),
    );
  }
}
