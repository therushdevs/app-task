import 'package:api_task/core/assets.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:flutter/material.dart';

class GigUserTypeSelectionPage extends StatelessWidget {
  const GigUserTypeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.gigLogo),
          const Text('Join Us'),
          const Text(
              'To begin this journey, tell us what type of content you\'d be opening.'),
          Column(
            children: [
              _createLoginCard(
                title: 'Individual',
                subTitle: 'Looking for jobs',
                imageAsset: Assets.individual,
              ),
              _createLoginCard(
                title: 'Company',
                subTitle: 'Looking for staff',
                imageAsset: Assets.group,
              ),
            ],
          ),
          const Text.rich(
            TextSpan(
              text: 'Already have an account? Login',
              children: [],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createLoginCard(
      {required String title,
      required String subTitle,
      required String imageAsset}) {
    return ListTile(
      onTap: () {
        navKey.currentState?.pushNamed(Routes.gigExploreTheAppPageRoute);
      },
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Image.asset(imageAsset),
    );
  }
}
