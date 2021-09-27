import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  bool _isVisible = true;
  bool get isVisble => _isVisible;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  bool _isValid = false;

  bool get isValid => _isValid;

  validateEmail(String input) {
    if (input.contains('@')&& input.contains('.com')) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }
}
