import 'package:api_task/core/assets.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GigUserTypeSelectionPage extends StatelessWidget {
  const GigUserTypeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 30, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                Assets.gigLogo,
                alignment: Alignment.center,
              ),
            ),
            const Text(
              'Join Us',
              style: boldBlack30,
            ),
            const Text(
              'To begin this journey, tell us what type of content you\'d be opening.',
              style: mediumGrey18,
            ),
            Column(
              children: [
                _createLoginCard(
                  title: 'Individual',
                  subTitle: 'Looking for jobs',
                  imageAsset: Assets.individual,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: _createLoginCard(
                    title: 'Company',
                    subTitle: 'Looking for staff',
                    imageAsset: Assets.group,
                  ),
                ),
              ],
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  style: mediumBlack12,
                  children: [
                    TextSpan(
                      text: 'Log in',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        color: Color(0xff2805FF),
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          navKey.currentState!.pushNamed(
                            Routes.gigCreateAccountPageRoute,
                            arguments: {'isLogin': true},
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createLoginCard({
    required String title,
    required String subTitle,
    required String imageAsset,
  }) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 28,
        contentPadding: const EdgeInsets.all(28),
        onTap: () {
          navKey.currentState?.pushNamed(Routes.gigExploreTheAppPageRoute);
        },
        title: Text(
          title,
          style: mediumBlack16,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Text(
            subTitle,
            style: mediumGrey14,
          ),
        ),
        leading: Image.asset(
          imageAsset,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
