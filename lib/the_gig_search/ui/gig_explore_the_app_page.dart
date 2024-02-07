import 'package:api_task/core/assets.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:api_task/the_gig_search/widgets/secondary_elevated_button.dart';
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
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 30, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.asset(Assets.gigLogo),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Explore the App',
                  style: boldBlack30,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 11.0, bottom: 76),
                  child: Text(
                    'Now your finances are in one place and always under control',
                    style: mediumGrey18,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    navKey.currentState?.pushNamed(Routes.gigSsoPageRoute);
                  },
                  child: const Text('Sign In'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 30),
                  child: SecondaryElevatedButton(
                    onPressed: () {
                      navKey.currentState
                          ?.pushNamed(Routes.gigCreateAccountPageRoute);
                    },
                    child: const Text(
                      'Create Account',
                      style: semiBoldBlack16,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
