import 'package:flutter/material.dart';

typedef Callback = void Function();

class CreditorView extends StatelessWidget {
  final bool isSelected;
  final String logoUrl;
  final Callback onTap;

  const CreditorView({
    Key? key,
    required this.isSelected,
    required this.logoUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - (4 * 16)) / 3,
            height: 51.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              border: Border.all(
                color: isSelected
                    ? const Color(0xff5d80fe)
                    : const Color(0xff90a4ae),
                width: isSelected ? 2.0 : 1.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(logoUrl),
          ),
        ],
      ),
    );
  }
}
