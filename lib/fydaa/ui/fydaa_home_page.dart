import 'package:flutter/material.dart';

class FydaaHomePage extends StatefulWidget {
  const FydaaHomePage({super.key});

  @override
  State<FydaaHomePage> createState() => _FydaaHomePageState();
}

class _FydaaHomePageState extends State<FydaaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(
            "Welcome to Fydaa!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
