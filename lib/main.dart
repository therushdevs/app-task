import 'package:api_task/providers/QuestionsProvider.dart';
import 'package:api_task/providers/radio_state_provider.dart';
import 'package:api_task/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<QuestionsProvider>(
              create: (_) => QuestionsProvider()),
          ChangeNotifierProvider<RadioStateProvider>(
              create: (_) => RadioStateProvider()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
