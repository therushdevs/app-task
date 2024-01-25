import 'dart:async';

import 'package:api_task/core/assets.dart';
import 'package:api_task/mobigic/routes.dart';
import 'package:flutter/material.dart';

class MobigicSplashPage extends StatefulWidget {
  const MobigicSplashPage({super.key});

  @override
  State<MobigicSplashPage> createState() => _MobigicSplashPageState();
}

class _MobigicSplashPageState extends State<MobigicSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      navKey.currentState?.pushNamedAndRemoveUntil(
        Routes.rowAndColumnPageRoute,
        (routes) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.mobigicLogo,
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
            const Text(
              'Mobigic Technologies',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
