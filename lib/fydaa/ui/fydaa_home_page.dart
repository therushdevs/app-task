import 'package:flutter/material.dart';

class FydaaHomePage extends StatefulWidget {
  const FydaaHomePage({super.key});

  @override
  State<FydaaHomePage> createState() => _FydaaHomePageState();
}

class _FydaaHomePageState extends State<FydaaHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("We are home"),
    ));
  }
}
