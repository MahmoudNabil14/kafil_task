class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.?[a-zA-Z]+)$').hasMatch(email);
  }

  static bool passwordHasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }
  static bool isNameValid(String name) {
    return RegExp(r'^.{1,50}$').hasMatch(name);
  }
  static bool isAboutValid(String name) {
    return RegExp(r'^.{10,1000}$',multiLine: true).hasMatch(name);
  }
}
