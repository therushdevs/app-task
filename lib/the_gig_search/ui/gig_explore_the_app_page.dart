import 'package:api_task/core/assets.dart';
import 'package:flutter/material.dart';

class GigExploreTheAppPage extends StatefulWidget {
  const GigExploreTheAppPage({super.key});

  @override
  State<GigExploreTheAppPage> createState() => _GigExploreTheAppPageState();
}

class _GigExploreTheAppPageState extends State<GigExploreTheAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.gigLogo),
          const Text('Explore the App'),
          const Text(
              'Now your finances are in one place and always under control'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Sign In'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Create Account'),
          )
        ],
      ),
    );
  }
}