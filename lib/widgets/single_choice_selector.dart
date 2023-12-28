import 'package:api_task/models/questions_model.dart';
import 'package:api_task/providers/radio_state_provider.dart';
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                  itemCount: question.schema!.options!.length,
                  itemBuilder: (context, index) {
                    final providerWatch = context.watch<RadioStateProvider>();
                    return Row(
                      children: [
                        Radio(
                            value: index + 1,
                            groupValue: providerWatch
                                .radioValues[question.schema!.name],
                            onChanged: (value) {
                              final radioProvider =
                                  context.read<RadioStateProvider>();
                              radioProvider.updateSelections(
                                  question.schema!.name, index + 1);
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
