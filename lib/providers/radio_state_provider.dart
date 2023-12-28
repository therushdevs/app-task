import 'package:flutter/material.dart';

class RadioStateProvider extends ChangeNotifier {
  final Map<String, int> radioValues = {};

  void updateSelections(String key, int value) {
    radioValues[key] = value;
    notifyListeners();
  }

  void clearSelections() {
    radioValues.forEach((key, value) {
      radioValues[key] = 0;
    });
    notifyListeners();
  }
}
