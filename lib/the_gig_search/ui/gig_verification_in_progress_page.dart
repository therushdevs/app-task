import 'package:api_task/core/assets.dart';
import 'package:flutter/material.dart';

class GigVerificationInProgress extends StatefulWidget {
  const GigVerificationInProgress({super.key});

  @override
  State<GigVerificationInProgress> createState() =>
      _GigVerificationInProgressState();
}

class _GigVerificationInProgressState extends State<GigVerificationInProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.checkIcon),
          const Text('Verification In Progress'),
          const Text(
            'We have received your application and a member of our staff will get in touch with you shortly',
          ),
        ],
      ),
    );
  }
}
