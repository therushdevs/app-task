import 'dart:async';

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
    Timer(Duration.zero, () {
      navKey.currentState?.pushNamedAndRemoveUntil(
        Routes.rowAndColumnPageRoute,
        (routes) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
