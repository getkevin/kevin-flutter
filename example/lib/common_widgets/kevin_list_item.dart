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
  final Widget _trailingWidget;
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
  })  : _trailingWidget = trailingWidget,
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
                child: _trailingWidget,
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
