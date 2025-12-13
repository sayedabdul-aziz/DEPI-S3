void main() {
  int number = 645;
  print(reverseNumber(number));
}

reverseNumber(int number) {
  // using while loop
  // 0% 10  ==> 645
  int reversed = 0;
  while (number != 0) {
    int remainder = number % 10; // 5
    reversed = reversed * 10 + remainder; // 640 + 5
    // string to store the remainder
    number ~/= 10;
  }
  return reversed;
}
