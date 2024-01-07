import 'package:api_task/constants.dart';
import 'package:flutter/material.dart';

class OtherPages extends StatelessWidget {
  const OtherPages({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '$title Page',
          style: titleBold,
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Text(
          'Welcome to $title Page',
          style: TextStyle(
            color: Colors.blueGrey.shade700,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      )),
    );
  }
}
