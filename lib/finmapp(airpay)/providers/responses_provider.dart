import 'package:flutter/material.dart';

class ResponsesProvider extends ChangeNotifier {
  final Map<String, int> radioValues = {};
  final List<Map<String, String>> responsesList = [];

  void updateSelections(String key, int value) {
    radioValues[key] = value;
    notifyListeners();
  }

  void clearSelections() {
    radioValues.forEach((key, value) {
      radioValues[key] = 0;
    });
    responsesList.clear();
    notifyListeners();
  }

  void addResponses(String key, String value) {
    bool containsKey = false;
    if (responsesList.isNotEmpty) {
      for (var element in responsesList) {
        if (element.containsKey(key)) {
          containsKey = true;
          responsesList[responsesList.indexOf(element)][key] = value;
        }
      }
      if (!containsKey) {
        responsesList.add({key: value});
      }
    } else {
      responsesList.add({key: value});
    }
    notifyListeners();
  }
}
