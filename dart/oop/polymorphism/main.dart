import 'shape.dart';

void main() {
  Area c = Circle(10);
  c.getArea();
  Area r = Rectangle(10, 20);
  r.getArea();

  getArea(r);
}

getArea(Area s) {
  s.getArea();
}
