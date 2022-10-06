import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

enum KevinListItemType {
  top,
  middle,
  bottom,
  single;

  bool get isTop => this == top;

  bool get isBottom => this == bottom;

  bool get isSingle => this == single;
}

class KevinListItem extends StatelessWidget {
  final Widget _leadingWidget;
  final String _text;
  final VoidCallback _onPressed;
  final KevinListItemType _type;
  final bool _selected;

  const KevinListItem({
    super.key,
    required Widget trailingWidget,
    required String text,
    required VoidCallback onPressed,
    KevinListItemType type = KevinListItemType.middle,
    bool selected = false,
  })  : _leadingWidget = trailingWidget,
        _text = text,
        _onPressed = onPressed,
        _type = type,
        _selected = selected;

  KevinListItem.defaultLeadingIcon({
    super.key,
    required String icon,
    required String text,
    required VoidCallback onPressed,
    Color? iconColor,
    Color? iconBackgroundColor,
    KevinListItemType type = KevinListItemType.middle,
    bool selected = false,
  })  : _leadingWidget = KevinListItemLeadingIcon(
          icon: icon,
          iconColor: iconColor,
          backgroundColor: iconBackgroundColor,
        ),
        _text = text,
        _onPressed = onPressed,
        _type = type,
        _selected = selected;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final typography = theme.typography;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: _getBorderRadius(),
            color: _selected
                ? color.bottomSheet.controlActivated
                : color.secondaryBackground,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: _leadingWidget,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  _text,
                  style: typography.title1,
                ),
              ),
              SvgPicture.asset(AppImages.chevronRight),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => _onPressed(),
            ),
          ),
        ),
      ],
    );
  }

  BorderRadius _getBorderRadius() {
    if (_type.isSingle) return BorderRadius.circular(11);

    final top = Radius.circular(_type.isTop ? 11 : 0);
    final bottom = Radius.circular(_type.isBottom ? 11 : 0);

    return BorderRadius.vertical(top: top, bottom: bottom);
  }
}

class KevinListItemLeadingIcon extends StatelessWidget {
  final String _icon;
  final Color? _iconColor;
  final Color? _backgroundColor;

  const KevinListItemLeadingIcon({
    super.key,
    required String icon,
    Color? iconColor,
    Color? backgroundColor,
  })  : _icon = icon,
        _iconColor = iconColor,
        _backgroundColor = backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor ?? color.primary,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Center(
        child: SvgPicture.asset(
          _icon,
          color: _iconColor ?? color.onPrimary,
        ),
      ),
    );
  }
}
