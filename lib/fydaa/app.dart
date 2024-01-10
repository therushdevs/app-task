import 'package:api_task/fydaa/ui/fyda_phone_page.dart';
import 'package:api_task/fydaa/ui/fydaa_home_page.dart';
import 'package:api_task/fydaa/ui/fydaa_otp_page.dart';
import 'package:flutter/material.dart';

class FydaaApp extends StatelessWidget {
  const FydaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme()),
      debugShowCheckedModeBanner: false,
      home: const FydaaPhonePage(),
    );
  }
}
