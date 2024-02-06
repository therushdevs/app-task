import 'package:api_task/the_gig_search/gig_splash_page.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routes = settings.name;
    switch (routes) {
      case Routes.gigSplashPageRoute:
        return MaterialPageRoute(builder: (_) => const GigSplashPage());

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
