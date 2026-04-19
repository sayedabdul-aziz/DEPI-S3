import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Navigator 1, Navigator 2  vs go_router

void pushReplacement(BuildContext context, String routeName, {Object? extra}) {
  context.pushReplacement(routeName, extra: extra);
}

Future<void> pushTo(BuildContext context, String routeName, {Object? extra}) {
  return context.push(routeName, extra: extra);
}

void pushToBase(BuildContext context, String routeName, {Object? extra}) {
  context.go(routeName, extra: extra);
}

void pop(BuildContext context) {
  context.pop();
}
