import 'package:api_task/finmapp(airpay)/models/questions_model.dart';
import 'package:api_task/finmapp(airpay)/providers/responses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleChoiceSelector extends StatelessWidget {
  const SingleChoiceSelector({super.key, required this.question});
  final Questions question;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.schema!.label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        question.type == "Numeric" || question.type == "Label"
            ? Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  keyboardType:
                      question.type == "Numeric" ? TextInputType.number : null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    print("Strings ${value}");
                    final responsesProvider = context.read<ResponsesProvider>();
                    responsesProvider.addResponses(
                      question.schema!.label,
                      value,
                    );
                  },
                  maxLines: 3,
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                  itemCount: question.schema!.options!.length,
                  itemBuilder: (context, index) {
                    final providerWatch = context.watch<ResponsesProvider>();
                    return Row(
                      children: [
                        Radio(
                            value: index + 1,
                            groupValue: providerWatch
                                .radioValues[question.schema!.name],
                            onChanged: (value) {
                              final responsesProvider =
                                  context.read<ResponsesProvider>();
                              responsesProvider.updateSelections(
                                  question.schema!.name, index + 1);

                              responsesProvider.addResponses(
                                question.schema!.label,
                                question.schema!.options![index].value,
                              );
                            }),
                        Text(question.schema!.options![index].value)
                      ],
                    );
                  },
                ),
              ),
      ],
    );
  }
}
