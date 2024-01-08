import 'package:api_task/finmapp(airpay)/providers/QuestionsProvider.dart';
import 'package:api_task/finmapp(airpay)/providers/responses_provider.dart';
import 'package:api_task/fydaa/app.dart';
import 'package:api_task/promilo/promilo_auth_provider.dart';
import 'package:api_task/promilo/ui/app.dart';
import 'package:api_task/promilo/ui/promilo_auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<QuestionsProvider>(
          create: (_) => QuestionsProvider()),
    ],
    child: const FydaaApp(),
  ));

  // promilo & finapp
  // runApp(MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider<QuestionsProvider>(
  //         create: (_) => QuestionsProvider()),
  //     ChangeNotifierProvider<ResponsesProvider>(
  //         create: (_) => ResponsesProvider()),
  //     ChangeNotifierProvider<PromiloAuthProvider>(
  //         create: (_) => PromiloAuthProvider()),
  //   ],
  //   child: const MyApp(),
  // ));
}
