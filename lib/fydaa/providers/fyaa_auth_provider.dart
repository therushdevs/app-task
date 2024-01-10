import 'package:flutter/material.dart';

class FydaaAuthProvider extends ChangeNotifier {
  String _phoneNumber = '';

  String getPhoneNumber() {
    return _phoneNumber;
  }

  void setPhoneNumber(String phone) {
    _phoneNumber = phone;
    notifyListeners();
  }
}
