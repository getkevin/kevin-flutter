import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class KevinFormField extends StatelessWidget {
  final TextEditingController? _controller;
  final FocusNode? _focusNode;
  final Function(String)? _onChanged;
  final Function(String)? _onFieldSubmitted;
  final TextCapitalization _textCapitalization;
  final TextInputType? _keyboardType;
  final TextInputAction? _textInputAction;
  final List<TextInputFormatter>? _inputFormatters;
  final String? _errorText;
  final String? _prefixText;
  final Widget? _suffixIcon;
  final VoidCallback? _onTap;

  const KevinFormField({
    super.key,
    TextEditingController? controller,
    FocusNode? focusNode,
    Function(String)? onChanged,
    Function(String)? onFieldSubmitted,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    String? prefixText,
    Widget? suffixIcon,
    VoidCallback? onTap,
  })  : _controller = controller,
        _focusNode = focusNode,
        _onChanged = onChanged,
        _onFieldSubmitted = onFieldSubmitted,
        _textCapitalization = textCapitalization,
        _keyboardType = keyboardType,
        _textInputAction = textInputAction,
        _inputFormatters = inputFormatters,
        _errorText = errorText,
        _prefixText = prefixText,
        _suffixIcon = suffixIcon,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: _onChanged,
      textCapitalization: _textCapitalization,
      style: typography.title2,
      keyboardType: _keyboardType,
      textInputAction: _textInputAction,
      inputFormatters: _inputFormatters,
      onTap: _onTap,
      onFieldSubmitted: _onFieldSubmitted,
      decoration: InputDecoration(
        prefixText: _prefixText,
        errorText: _errorText,
        suffixIcon: _suffixIcon,
        contentPadding: const EdgeInsets.all(12),
        filled: true,
        fillColor: color.secondaryBackground,
        border: MaterialStateOutlineInputBorder.resolveWith((states) {
          if (states.contains(MaterialState.error) &&
              states.contains(MaterialState.focused)) {
            return OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: color.error, width: 2),
            );
          } else if (states.contains(MaterialState.error)) {
            return OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: color.error, width: 1),
            );
          } else if (states.contains(MaterialState.focused)) {
            return OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: color.primary, width: 2),
            );
          } else {
            return OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: color.inputUnfocusedBorder, width: 2),
            );
          }
        }),
      ),
    );
  }
}

class KevinFormFieldClearIcon extends StatelessWidget {
  final String _text;
  final VoidCallback _onPressed;

  const KevinFormFieldClearIcon({
    super.key,
    required String text,
    required VoidCallback onPressed,
  })  : _text = text,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final decoration = theme.decoration;

    return AnimatedOpacity(
      opacity: _text.isNotEmpty ? 1 : 0,
      duration: decoration.duration.defaultDuration,
      curve: decoration.animationCurve.defaultCurve,
      child: IconButton(
        onPressed: _onPressed,
        icon: SvgPicture.asset(
          AppImages.cross,
          color: color.secondaryText,
        ),
      ),
    );
  }
}
