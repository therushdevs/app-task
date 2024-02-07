import 'dart:async';

import 'package:api_task/core/assets.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class GigSplashPage extends StatefulWidget {
  const GigSplashPage({super.key});

  @override
  State<GigSplashPage> createState() => _GigSplashPageState();
}

class _GigSplashPageState extends State<GigSplashPage> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  Future<void> _startTimer() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        navKey.currentState?.pushNamedAndRemoveUntil(
          Routes.gigUserTypeSelectionPageRoute,
          (route) => false,
        );
      } else {
        print('User is signed in!');
        navKey.currentState!.pushNamedAndRemoveUntil(
            Routes.gigVerificationSuccessPageRoute, (route) => false);
      }
    });
    // FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(Assets.gigLogo),
      ),
    );
  }
}
