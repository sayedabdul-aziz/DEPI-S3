import 'package:flutter/material.dart';

void pushTo(BuildContext context, Widget newScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => newScreen));
}

void pushReplacement(BuildContext context, Widget newScreen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
  );
}

void pop(BuildContext context) {
  Navigator.pop(context);
}

Widget verticalSpace(double height) {
  return SizedBox(height: height);
}

extension SizeExtension on num {
  Widget get h => SizedBox(height: this.toDouble());
}


// pushTO(context, newScreen)  ==> Function
// context.pushTo(newScreen)  ==> Extension
// verticalSpace(10) ==> Function
// 10.h ==> extension