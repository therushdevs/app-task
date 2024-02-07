import 'dart:async';

import 'package:api_task/core/assets.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:flutter/material.dart';

class GigVerificationInProgress extends StatefulWidget {
  const GigVerificationInProgress({super.key});

  @override
  State<GigVerificationInProgress> createState() =>
      _GigVerificationInProgressState();
}

class _GigVerificationInProgressState extends State<GigVerificationInProgress> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      navKey.currentState?.pushNamed(Routes.gigVerificationSuccessPageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.blueCheck),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 34.0,
                      top: 56,
                    ),
                    child: Text(
                      'Verification In Progress',
                      style: boldBlack30,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    'We have received your application and a member of our staff will get in touch with you shortly',
                    textAlign: TextAlign.center,
                    style: normalBlack14,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
