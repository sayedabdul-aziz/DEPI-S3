void main() async {
  print("Task 1");
  try {
    await doTask2().then(
      (value) {
        print(value);
      },
      onError: (e) {
        print(e);
      },
    );
  } on Exception catch (e) {
    print(e);
  }

  print("Task 3");
}

Future<String> doTask2() async {
  return await Future.delayed(Duration(seconds: 2), () => throw "Error");
}
