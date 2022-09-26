import 'package:flutter/material.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class KevinCheckBox extends StatelessWidget {
  final bool _value;
  final Widget _trailingWidget;
  final Function(bool) _onChanged;

  const KevinCheckBox({
    super.key,
    required bool value,
    required Widget trailingWidget,
    required Function(bool) onChanged,
  })  : _value = value,
        _trailingWidget = trailingWidget,
        _onChanged = onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return Row(
      children: [
        Checkbox(
          value: _value,
          activeColor: color.primary,
          checkColor: color.primaryBackground,
          onChanged: (value) {
            if (value != null) {
              _onChanged(value);
            }
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => _onChanged(!_value),
            child: _trailingWidget,
          ),
        )
      ],
    );
  }
}
