import 'package:flutter/cupertino.dart';
import 'package:kevin_flutter_example/common_widgets/kevin_bottom_sheet_header.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';

class KevinListBottomDialog extends StatelessWidget {
  final String _title;
  final int _itemCount;
  final IndexedWidgetBuilder _builder;
  final ScrollController? _scrollController;
  final ScrollPhysics? _physics;
  final bool _shrinkWrap;
  final bool _animateList;

  const KevinListBottomDialog({
    super.key,
    required String title,
    required int itemCount,
    required IndexedWidgetBuilder builder,
    ScrollController? scrollController,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    bool animateList = false,
  })  : _title = title,
        _itemCount = itemCount,
        _builder = builder,
        _scrollController = scrollController,
        _physics = physics,
        _shrinkWrap = shrinkWrap,
        _animateList = animateList;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final animation = theme.animation;

    Widget child = Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ListView.builder(
        controller: _scrollController,
        physics: _physics,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 36),
        itemBuilder: _builder,
        shrinkWrap: _shrinkWrap,
        itemCount: _itemCount,
      ),
    );

    if (_animateList) {
      child = AnimatedSize(
        duration: animation.duration.defaultDuration,
        child: child,
      );
    }

    return Stack(
      children: [
        child,
        KevinBottomSheetHeader(
          // TODO: Localisation
          text: _title,
          positioned: true,
        )
      ],
    );
  }
}
