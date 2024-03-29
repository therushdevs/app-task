import 'package:api_task/cognota/cognota_app.dart';
import 'package:api_task/finmapp(airpay)/providers/QuestionsProvider.dart';
import 'package:api_task/finmapp(airpay)/providers/responses_provider.dart';
import 'package:api_task/firebase_options.dart';
import 'package:api_task/fydaa/app.dart';
import 'package:api_task/fydaa/providers/fyaa_auth_provider.dart';
import 'package:api_task/mobigic/mobigic_app..dart';
import 'package:api_task/promilo/promilo_auth_provider.dart';
import 'package:api_task/promilo/ui/app.dart';
import 'package:api_task/promilo/ui/promilo_auth_page.dart';
import 'package:api_task/the_gig_search/gig_my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    const CognotaApp(),
  );

  // mobigic entry point
  // runApp(
  //   const MobigicApp(),
  // );

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
