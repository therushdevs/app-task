import 'dart:async';

import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:flutter/material.dart';

class GigSplashPage extends StatefulWidget {
  const GigSplashPage({super.key});

  @override
  State<GigSplashPage> createState() => _GigSplashPageState();
}

class _GigSplashPageState extends State<GigSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      navKey.currentState
          ?.pushReplacementNamed(Routes.gigUserTypeSelectionPageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
