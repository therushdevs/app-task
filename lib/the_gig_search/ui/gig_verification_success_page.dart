import 'package:api_task/core/assets.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
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
      body: SafeArea(
        minimum: const EdgeInsets.all(11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.checkIcon),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 47.0),
              child: Text(
                'Success!',
                style: boldBlack20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Congratulations! you have been successfully authenticated',
                textAlign: TextAlign.center,
                style: mediumGrey18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
