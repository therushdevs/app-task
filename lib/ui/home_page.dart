import 'package:api_task/providers/QuestionsProvider.dart';
import 'package:api_task/providers/responses_provider.dart';
import 'package:api_task/ui/response_page.dart';
import 'package:api_task/widgets/progress_line_widget.dart';
import 'package:api_task/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 0);
  double progress = 1;

  @override
  void initState() {
    super.initState();
    final provider = context.read<QuestionsProvider>();
    provider.fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<QuestionsProvider>();
    final questions = providerWatch.questionsList;
    final n = (questions != null ? questions.length : 0);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'About Loan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResponsesPage(),
                        ),
                      );
                    },
                    child: const Text('See Responses'),
                  ),
                ],
              ),
            ),
            ProgressLineWidget(
              n: n,
              value: progress,
            ),
            Expanded(
              child: providerWatch.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : providerWatch.hasError
                      ? Center(
                          child: Text("Error: ${providerWatch.errMsg}"),
                        )
                      : PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _controller,
                          children: questions != null && questions.isNotEmpty
                              ? questions
                                  .map((question) =>
                                      QuestionWidget(question: question))
                                  .toList()
                              : [],
                        ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _controller.previousPage(
                      duration: const Duration(microseconds: 100),
                      curve: Curves.linear,
                    );
                    if (progress <= n && progress > 1) {
                      setState(() {
                        progress -= 1;
                      });
                      print('Prev: ${progress}');
                    }
                  },
                  child: const Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final provider = context.read<ResponsesProvider>();
                    provider.clearSelections();
                  },
                  child: const Text("Clear All Selections"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _controller.nextPage(
                      duration: const Duration(microseconds: 100),
                      curve: Curves.linear,
                    );
                    if (progress < n && progress >= 1) {
                      setState(() {
                        progress += 1;
                      });
                      print('Next: ${progress}');
                    }
                  },
                  child: const Text("Next"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
