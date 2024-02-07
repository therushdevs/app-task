import 'package:api_task/core/assets.dart';
import 'package:api_task/promilo/widgets/loader.dart';
import 'package:api_task/the_gig_search/providers/sso_provider.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:api_task/the_gig_search/widgets/secondary_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GigVerificationSuccess extends StatefulWidget {
  const GigVerificationSuccess({super.key});

  @override
  State<GigVerificationSuccess> createState() => _GigVerificationSuccessState();
}

class _GigVerificationSuccessState extends State<GigVerificationSuccess> {
  String? _emailAddress;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          _emailAddress = user.email;
        });
        print('$_emailAddress ${user.email}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(11),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.checkIcon),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 47.0),
                  child: Text(
                    'Success!',
                    style: boldBlack20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Congratulations User!${_emailAddress != null ? ' (${_emailAddress}) ' : ''}you have been successfully authenticated',
                    textAlign: TextAlign.center,
                    style: mediumGrey18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 28.0,
                    bottom: 16,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();

                      navKey.currentState!.pushNamedAndRemoveUntil(
                        Routes.gigSplashPageRoute,
                        (route) => false,
                      );
                    },
                    child: const Text('Continue'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: SecondaryElevatedButton(
                    onPressed: () {
                      context.read<SsoProvider>().logOut();
                    },
                    child: const Text('Log Out'),
                  ),
                ),
              ],
            ),
            Loader(
              isVisible: context.watch<SsoProvider>().isLoading,
            )
          ],
        ),
      ),
    );
  }
}
