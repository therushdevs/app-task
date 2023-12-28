import 'package:api_task/providers/responses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsesPage extends StatelessWidget {
  const ResponsesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.read<ResponsesProvider>();
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: watchProvider.responsesList.length,
          itemBuilder: (context, index) {
            final response = watchProvider.responsesList[index];
            response.forEach((key, value) {});
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: response.entries
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${e.key}:',
                            style: const TextStyle(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            e.value,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
