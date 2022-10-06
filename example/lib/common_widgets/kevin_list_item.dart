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
  final Widget _centerWidget;
  final Widget? _leadingWidget;
  final Widget? _trailingWidget;
  final VoidCallback? _onPressed;
  final KevinListItemType _type;
  final bool _selected;

  const KevinListItem({
    super.key,
    required Widget centerWidget,
    Widget? leadingWidget,
    Widget? trailingWidget,
    VoidCallback? onPressed,
    KevinListItemType type = KevinListItemType.middle,
    bool selected = false,
  })  : _centerWidget = centerWidget,
        _leadingWidget = leadingWidget,
        _trailingWidget = trailingWidget,
        _onPressed = onPressed,
        _type = type,
        _selected = selected;

  factory KevinListItem.defaultItem({
    Key? key,
    required String icon,
    required String text,
    required VoidCallback onPressed,
    Color? iconColor,
    Color? iconBackgroundColor,
    KevinListItemType type = KevinListItemType.middle,
    bool selected = false,
  }) {
    return KevinListItem(
      centerWidget: KevinListItemCenterText(text: text),
      leadingWidget: KevinListItemLeadingIcon(
        icon: icon,
        iconColor: iconColor,
        backgroundColor: iconBackgroundColor,
      ),
      trailingWidget: const KevinListItemTrailingArrow(),
      onPressed: onPressed,
      type: type,
      selected: selected,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    final leading = _leadingWidget != null
        ? Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              height: 40,
              width: 40,
              child: _leadingWidget,
            ),
          )
        : null;

    final trailing = _trailingWidget != null
        ? SizedBox(
            height: 48,
            width: 48,
            child: _trailingWidget,
          )
        : null;

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
              if (leading != null) leading,
              Expanded(child: _centerWidget),
              if (trailing != null) trailing,
            ],
          ),
        ),
        if (_onPressed != null)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: _getBorderRadius(),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: _onPressed,
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

class KevinListItemTrailingArrow extends StatelessWidget {
  const KevinListItemTrailingArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SvgPicture.asset(AppImages.chevronRight),
    );
  }
}

class KevinListItemCenterText extends StatelessWidget {
  final String text;

  const KevinListItemCenterText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final typography = theme.typography;

    return Text(
      text,
      style: typography.title1,
    );
  }
}
