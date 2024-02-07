import 'package:api_task/core/assets.dart';
import 'package:flutter/material.dart';

class GigVerificationSuccess extends StatefulWidget {
  const GigVerificationSuccess({super.key});

  @override
  State<GigVerificationSuccess> createState() => _GigVerificationSuccessState();
}

class _GigVerificationSuccessState extends State<GigVerificationSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.checkIcon),
          const Text('Success!'),
          const Text(
            'Congratulations! you have been successfully authenticated',
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
