import 'package:api_task/core/assets.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:api_task/the_gig_search/widgets/secondary_elevated_button.dart';
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
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 30, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Image.asset(Assets.gigLogo)),
            Column(
              children: [
                const Text(
                  'Explore The App',
                  style: boldBlack30,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 34),
                  child: Text(
                    'Now your finances are in one place and always under control',
                    style: mediumGrey18,
                    textAlign: TextAlign.center,
                  ),
                ),
                _roundedSsoButton(
                  assetImage: Assets.googleIcon,
                  text: 'Continue with Google',
                  onPressed: () {
                    navKey.currentState
                        ?.pushNamed(Routes.gigVerificationInProgressPageRoute);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 34.0),
                  child: _roundedSsoButton(
                    onPressed: () {},
                    assetImage: Assets.appleIcon,
                    text: 'Continue with Apple',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 52.0),
                  child: _roundedSsoButton(
                    onPressed: () {},
                    assetImage: Assets.messageIcon,
                    text: 'Continue with Email',
                  ),
                ),
                // const Text.rich(
                //   TextSpan(text: 'Already have an account? Log in'),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _roundedSsoButton({
    required String assetImage,
    required String text,
    required void Function() onPressed,
  }) {
    return SecondaryElevatedButton(
      borderRadius: 28,
      onPressed: onPressed,
      child: ListTile(
        // children: [
        leading: Image.asset(assetImage),
        title: Text(text),
        // ],
      ),
    );
  }
}
