import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kevin_flutter_example/theme/widget/app_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const _modalSheetEdgeToEdgeContainerHeight = 56.0;

Future<T?> showKevinBottomSheet<T>({
  required BuildContext context,
  required ScrollableWidgetBuilder builder,
  bool isDismissible = true,
  bool edgeToEdge = true,
  double? closeProgressThreshold,
}) {
  return _showMaterialBottomSheet(
    context: context,
    builder: (context) => builder(context, ModalScrollController.of(context)!),
    isDismissible: isDismissible,
    edgeToEdge: edgeToEdge,
    closeProgressThreshold: closeProgressThreshold,
  );
}

Future<T?> _showMaterialBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  required bool isDismissible,
  required edgeToEdge,
  double? closeProgressThreshold,
}) async {
  final theme = AppTheme.of(context);
  final decoration = theme.decoration;

  final result = await Navigator.of(context, rootNavigator: false).push(
    ModalBottomSheetRoute<T>(
      builder: builder,
      closeProgressThreshold: closeProgressThreshold,
      containerBuilder: _materialContainerBuilder(
        context: context,
        edgeToEdge: edgeToEdge,
      ),
      expanded: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      isDismissible: isDismissible,
      modalBarrierColor: Colors.black.withOpacity(0.4),
      duration: decoration.duration.longDuration,
    ),
  );
  return result;
}

WidgetWithChildBuilder _materialContainerBuilder({
  required BuildContext context,
  required bool edgeToEdge,
}) {
  return (context, animation, child) {
    return AnimatedBuilder(
      animation: animation,
      child: _ModalSheetBody(child: child),
      builder: (context, child) {
        return _AnimatedModalSheetBody(
          animation: animation,
          edgeToEdge: edgeToEdge,
          child: child!,
        );
      },
    );
  };
}

class _ModalSheetBody extends StatelessWidget {
  final Widget _child;

  const _ModalSheetBody({
    required Widget child,
  }) : _child = child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;

    return SafeArea(
      bottom: false,
      child: Material(
        color: color.primaryBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(11.0),
            topRight: Radius.circular(11.0),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: _child,
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: _DraggerIcon(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DraggerIcon extends StatelessWidget {
  const _DraggerIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
      ),
      child: Container(
        height: 5,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _AnimatedModalSheetBody extends StatefulWidget {
  final Animation<double> _animation;
  final bool _edgeToEdge;
  final Widget _child;

  const _AnimatedModalSheetBody({
    required Animation<double> animation,
    required bool edgeToEdge,
    required Widget child,
  })  : _animation = animation,
        _edgeToEdge = edgeToEdge,
        _child = child;

  @override
  State<StatefulWidget> createState() => _AnimatedModalSheetBodyState();
}

class _AnimatedModalSheetBodyState extends State<_AnimatedModalSheetBody> {
  final _key = GlobalKey();

  var _showEdgeToEdgeContainer = false;

  @override
  void initState() {
    super.initState();

    _maybeSetShowEdgeToEdgeContainer();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (notification) {
        _maybeSetShowEdgeToEdgeContainer();
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: Stack(
          key: _key,
          children: [
            if (_showEdgeToEdgeContainer)
              _AnimatedEdgeToEdgeContainer(
                key: ValueKey(_showEdgeToEdgeContainer),
                animationProgress: widget._animation.value,
              ),
            widget._child
          ],
        ),
      ),
    );
  }

  void _maybeSetShowEdgeToEdgeContainer() {
    if (!widget._edgeToEdge || _showEdgeToEdgeContainer) return;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      final height = MediaQuery.of(context).size.height.floor();
      final size = _key.currentContext?.size?.height.floor() ?? 0;

      if (size >= height) {
        setState(() {
          _showEdgeToEdgeContainer = true;
        });
      }
    });
  }
}

class _AnimatedEdgeToEdgeContainer extends StatelessWidget {
  final double _animationProgress;

  const _AnimatedEdgeToEdgeContainer({
    super.key,
    required double animationProgress,
  }) : _animationProgress = animationProgress;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = theme.color;
    final decoration = theme.decoration;

    return Transform.translate(
      offset: Offset(
        0,
        _getEdgeToEdgeContainerOffset(
          containerHeight: _modalSheetEdgeToEdgeContainerHeight,
          animationProgress: _animationProgress,
        ),
      ),
      child: AnimatedContainer(
        duration: decoration.duration.shortDuration,
        height: _modalSheetEdgeToEdgeContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_animationProgress < 1 ? 11 : 0),
          color: color.primaryBackground,
        ),
      ),
    );
  }
}

double _getEdgeToEdgeContainerOffset({
  required double containerHeight,
  required double animationProgress,
}) {
  final coef = containerHeight * 100;

  if (animationProgress <= 0.99) {
    return containerHeight;
  } else {
    return (-coef * animationProgress) + coef;
  }
}
