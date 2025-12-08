// displayInfo (name, job , salary)

// positional (job optional)
// named (job optional)

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.forEach((e) {});
  add(3, 4);
  display("John", 20);
  display4("ahmed", age: 20, gender: "male");
}

// 1) Positional Parameters (Ordered , required)
void display(String name, int age) {
  print("Name: $name, Age: $age");
}

// 2) Positional Parameters (Ordered , required & optional)
void display1(String name, [int age = 20]) {
  print("Name: $name, Age: $age");
}

// 3) Named Parameters (Not Ordered , required)
void display2({required String name, required int age}) {
  print("Name: $name, Age: $age");
}

// 4) Named Parameters (Not Ordered , required)
void display3({required String name, int age = 20}) {
  print("Name: $name, Age: $age");
}

void display4(String name, {required String gender, int age = 20}) {
  print("Name: $name, Age: $age, Gender: $gender");
}

int add(int a, int b) => a + b;

// 5

int fact(int n) {
  if (n == 1) {
    return 1;
  } else {
    return n * fact(n - 1); // 5 * 4 * 3 * 2 * 1
  }
}
