import 'package:api_task/the_gig_search/gig_splash_page.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:api_task/the_gig_search/ui/gig_create_account_page.dart';
import 'package:api_task/the_gig_search/ui/gig_explore_the_app_page.dart';
import 'package:api_task/the_gig_search/ui/gig_user_type_seletion.dart';
import 'package:api_task/the_gig_search/ui/gig_verification_in_progress_page.dart';
import 'package:api_task/the_gig_search/ui/gig_verification_success_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routes = settings.name;
    switch (routes) {
      case Routes.gigSplashPageRoute:
        return MaterialPageRoute(
          builder: (_) => const GigSplashPage(),
        );
      case Routes.gigCreateAccountPageRoute:
        return MaterialPageRoute(
          builder: (_) => const GigCreateAccountPage(),
        );
      case Routes.gigExploreTheAppPageRoute:
        return MaterialPageRoute(
          builder: (_) => const GigExploreTheAppPage(),
        );
      case Routes.gigUserTypeSelectionPageRoute:
        return MaterialPageRoute(
          builder: (_) => const GigUserTypeSelectionPage(),
        );
      case Routes.gigVerificationInProgressPageRoute:
        return MaterialPageRoute(
          builder: (_) => const GigVerificationInProgress(),
        );
      case Routes.gigVerificationSuccessPageRoute:
        return MaterialPageRoute(
          builder: (_) => const GigVerificationSuccess(),
        );
      default:
        return _errorRoute();
    }
  }

  static _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error ROute'),
        ),
      ),
    );
  }
}
