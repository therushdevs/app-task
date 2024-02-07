import 'package:api_task/core/assets.dart';
import 'package:api_task/promilo/widgets/loader.dart';
import 'package:api_task/the_gig_search/providers/sso_provider.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:api_task/the_gig_search/widgets/secondary_elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GigSsoPage extends StatelessWidget {
  const GigSsoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 30,
          right: 16,
          left: 16,
          bottom: 16,
        ),
        child: Stack(
          children: [
            Column(
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
                        // navKey.currentState
                        //     ?.pushNamed(Routes.gigVerificationInProgressPageRoute);
                        context.read<SsoProvider>().googleSso();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 34.0),
                      child: _roundedSsoButton(
                        onPressed: () {
                          context.read<SsoProvider>().appleSso();
                        },
                        assetImage: Assets.appleIcon,
                        text: 'Continue with Apple',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 52.0),
                      child: _roundedSsoButton(
                        onPressed: () {
                          navKey.currentState!.pushNamed(
                            Routes.gigCreateAccountPageRoute,
                            arguments: {
                              "isLogin": true,
                            },
                          );
                        },
                        assetImage: Assets.messageIcon,
                        text: 'Continue with Email',
                      ),
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
                )
              ],
            ),
            Loader(isVisible: context.watch<SsoProvider>().isLoading),
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
