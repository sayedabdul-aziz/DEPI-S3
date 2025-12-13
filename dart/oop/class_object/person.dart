enum Gender { Male, Female }


class Person {
  String? _fName;
  String? _lName;
  int? _age;
  Gender? gender;

  void setFName(String name) {
    _fName = name;
  }

  void setLName(String name) {
    _lName = name;
  }

  set setAge(int age) {
    if (age > 0) {
      this._age = age;
    }
  }

  String _getFName() {
    return _fName ?? "";
  }

  String _getLName() {
    return _lName ?? "";
  }

  String get getName => "${_getFName()} ${_getLName()}";

  int getAge() {
    return _age ?? 0;
  }
}
