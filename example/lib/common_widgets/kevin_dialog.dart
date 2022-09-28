import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KevinDialog extends StatelessWidget {
  final String? _title;
  final String? _content;
  final List<KevinDialogAction> _actions;

  const KevinDialog({
    super.key,
    required List<KevinDialogAction> actions,
    String? title,
    String? content,
  })  : _actions = actions,
        _title = title,
        _content = content;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _CupertinoKevinDialog(
        title: _title,
        content: _content,
        actions: _actions,
      );
    }

    return _MaterialKevinDialog(
      title: _title,
      content: _content,
      actions: _actions,
    );
  }
}

class KevinDialogAction extends StatelessWidget {
  final String _text;
  final VoidCallback? _onPressed;

  const KevinDialogAction({
    super.key,
    required String text,
    required VoidCallback? onPressed,
  })  : _text = text,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoDialogAction(
        onPressed: _onPressed,
        child: Text(_text),
      );
    }

    return TextButton(onPressed: _onPressed, child: Text(_text));
  }
}

class _MaterialKevinDialog extends StatelessWidget {
  final String? _title;
  final String? _content;
  final List<KevinDialogAction> _actions;

  const _MaterialKevinDialog({
    required String? title,
    required String? content,
    required List<KevinDialogAction> actions,
  })  : _title = title,
        _content = content,
        _actions = actions;

  @override
  Widget build(BuildContext context) {
    final titleWidget = _title != null ? Text(_title!) : null;
    final contentWidget = _content != null ? Text(_content!) : null;

    return AlertDialog(
      title: titleWidget,
      content: contentWidget,
      actions: _actions,
      actionsOverflowDirection: VerticalDirection.up,
    );
  }
}

class _CupertinoKevinDialog extends StatelessWidget {
  final String? _title;
  final String? _content;
  final List<KevinDialogAction> _actions;

  const _CupertinoKevinDialog({
    required String? title,
    required String? content,
    required List<KevinDialogAction> actions,
  })  : _title = title,
        _content = content,
        _actions = actions;

  @override
  Widget build(BuildContext context) {
    final titleWidget = _title != null ? Text(_title!) : null;
    final contentWidget = _content != null ? Text(_content!) : null;

    return CupertinoAlertDialog(
      title: titleWidget,
      content: contentWidget,
      actions: _actions,
    );
  }
}

Future<T?> showKevinDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool dismissible = true,
}) {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: builder,
      barrierDismissible: dismissible,
    );
  }

  return showDialog(
    context: context,
    builder: builder,
    barrierDismissible: dismissible,
  );
}
