import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Size? getWidgetSize(GlobalKey key) {
  final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
  return renderBox?.size;
}

Flushbar showSuccessToast(
  BuildContext context,
  String title,
  String message, [
  Duration? duration,
]) {
  return Flushbar(
    title: title,
    message: message,
    icon: const Icon(
      Icons.check,
      size: 28.0,
      color: Colors.white,
    ),
    duration: duration ?? const Duration(seconds: 4),
    backgroundGradient: LinearGradient(
      colors: [Colors.green[600]!, Colors.green[400]!],
    ),
    onTap: (flushbar) => flushbar.dismiss(),
  )..show(context);
}

Flushbar showErrorToast(BuildContext context, String title, String message) {
  return Flushbar(
    title: ('info:'.matchAsPrefix(message) != null ? 'Info' : title),
    message: ('info:'.matchAsPrefix(message) != null
        ? message.substring(5)
        : message),
    icon: const Icon(
      Icons.error,
      size: 28.0,
      color: Colors.white,
    ),
    duration: const Duration(seconds: 4),
    backgroundGradient: LinearGradient(
      colors: ('info:'.matchAsPrefix(message) != null
          ? [Colors.green[600]!, Colors.green[400]!]
          : [Colors.red[600]!, Colors.red[400]!]),
    ),
    onTap: (flushbar) => flushbar.dismiss(),
  )..show(context);
}
