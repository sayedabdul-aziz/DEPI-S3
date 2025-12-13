import 'dart:math';

abstract class Area {
  int? id;
  void getArea();
}

mixin Perimeter {
  void startAnimation() {
    print("Animation started");
  }
}

class Rectangle implements Area, Perimeter {
  double d1;
  double d2;

  Rectangle(this.d1, this.d2);

  @override
  void getArea() {
    print("Area is ${d1 * d2}");
  }

  @override
  int? id;

  @override
  void startAnimation() {
    // TODO: implement startAnimation
  }
}

class Circle extends Area {
  double d1;
  Circle(this.d1);
  @override
  void getArea() {
    print("Area is ${pi * d1 * d1}");
  }
}

// Pending, Paid, Cancelled, Delivered, Shipped, Refunded
// 1,2,3,4,5,6

// paymentState = PaymentState.Pending.value;   // avoid magic numbers

enum PaymentState { Pending, Paid, Cancelled, Delivered, Shipped, Refunded }
