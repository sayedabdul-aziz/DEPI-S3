import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future pushTo(BuildContext context, String route, {Object? extra}) {
  return context.push(route, extra: extra);
}

void pushWithReplacement(BuildContext context, String route, {Object? extra}) {
  return context.pushReplacement(route, extra: extra);
}

void pushToBase(BuildContext context, String route, {Object? extra}) {
  return context.go(route, extra: extra);
}

void pop(BuildContext context) {
  return context.pop();
}
