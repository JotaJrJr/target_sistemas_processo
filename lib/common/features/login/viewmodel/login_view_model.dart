import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  // String get getPassword => passwordController.text.trim();

  bool canLogin() {
    return userController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordController.text.length < 20 &&
        userController.text.length < 20 &&
        userController.text.length >= 2 &&
        ultimoCaractereBranco(userController.text) &&
        ultimoCaractereBranco(passwordController.text) &&
        correctRegex();
    // userController.text.trim()
  }

  bool correctRegex() {
    return RegExp(r"^[a-zA-Z0-9]+$").hasMatch(passwordController.text);
  }

  void login() {
    print("Login");
  }

  void obscurePassword() {
    obscureText = !obscureText;
    notifyListeners();
  }

  bool ultimoCaractereBranco(String texto) {
    if (texto.substring(texto.length - 1) == " ") {
      return false;
    }
    return true;
  }
}
