import 'package:api_task/finmapp(airpay)/models/questions_model.dart';
import 'package:api_task/finmapp(airpay)/widgets/single_choice_selector.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key, required this.question});
  final Questions question;

  @override
  Widget build(BuildContext context) {
    return question.type == 'SingleChoiceSelector' ||
            question.type == 'SingleSelect'
        ? SingleChoiceSelector(
            question: question,
          )
        : Column(
            children: [
              Text(
                question.schema!.label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: question.schema!.fields!.length,
                  itemBuilder: (context, index) {
                    return SingleChoiceSelector(
                      question: question.schema!.fields![index],
                    );
                  },
                ),
              )
            ],
          );
  }
}
