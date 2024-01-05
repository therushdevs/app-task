import 'dart:convert';

import 'package:api_task/models/questions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionsProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  String? errMsg;
  List<Questions>? questionsList;

  QuestionsProvider({
    this.questionsList,
    this.errMsg,
  }) : super();

  void fetchQuestions() async {
    isLoading = true;
    // try {
    final String response =
        await rootBundle.loadString('assets/json/Questions.json');
    final data = await json.decode(response);
    final jsonList = data['schema']['fields'];
    questionsList = Questions.toList(jsonList);
    isLoading = false;
    // } catch (err) {
    //   isLoading = false;
    //   hasError = true;
    //   errMsg = err.toString();
    // }
    notifyListeners();
  }
}
