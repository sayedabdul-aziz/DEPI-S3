import 'person.dart';

main() {
  // create an object
  Person p1 = Person();
  p1.gender = Gender.Female;
  p1.setFName("Ahmed");
  p1.setLName("Ali");
  p1.setAge = 20;

  print(p1.getName);
  print(p1.getAge());
}
