class Person {
  String? name;
  int? id;

  Person({required this.name, required this.id});

  void display() {
    print("Super");
    print("Name: ${name}");
    print("ID: $id");
  }

  void calc() {}
}

class Student extends Person {
  int? grade;

  Student({super.name, super.id, this.grade});

  @override
  void display() {
    super.calc();
    print("Grade: $grade");
  }
}

class Doctor extends Person {
  double? salary;

  Doctor({super.name, super.id, this.salary});

  @override
  void display() {
    print("Name: $name");
    print("ID: $id");
    print("Salary: $salary");
  }
}
