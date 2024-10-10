import 'package:flutter/material.dart';

class ValidationProvider with ChangeNotifier {
  bool _isValid = false;
  String _errorMessage = '';

  bool get isValid => _isValid;
  String get errorMessage => _errorMessage;

  void validate(bool isValid, String errorMessage) {
    _isValid = isValid;
    _errorMessage = errorMessage;
    notifyListeners();
  }
}