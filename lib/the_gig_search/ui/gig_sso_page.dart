import 'package:api_task/core/assets.dart';
import 'package:flutter/material.dart';

class GigSsoPage extends StatefulWidget {
  const GigSsoPage({super.key});

  @override
  State<GigSsoPage> createState() => _GigSsoPageState();
}

class _GigSsoPageState extends State<GigSsoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.gigLogo),
          const Text('Explore The App'),
          const Text(
              'Now your finances are in one place and always under control'),
          _roundedSsoButton(
            assetImage: Assets.googleIcon,
            text: 'Continue with Google',
          ),
          _roundedSsoButton(
            assetImage: Assets.appleIcon,
            text: 'Continue with Apple',
          ),
          _roundedSsoButton(
            assetImage: Assets.messageIcon,
            text: 'Continue with Email',
          ),
          RichText(
            text: const TextSpan(text: 'Already have an account? Log in'),
          ),
        ],
      ),
    );
  }

  Widget _roundedSsoButton({
    required String assetImage,
    required String text,
    void Function()? onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Image.asset(assetImage),
          Text(text),
        ],
      ),
    );
  }
}
