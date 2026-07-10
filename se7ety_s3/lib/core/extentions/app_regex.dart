class AppRegex {
  static bool isEmailValid(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  static bool isEgyptianPhoneValid(String phone) {
    String phonePattern = r'^01[0125][0-9]{8}$';
    RegExp regex = RegExp(phonePattern);
    return regex.hasMatch(phone);
  }
}
