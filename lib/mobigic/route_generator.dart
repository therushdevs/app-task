import 'package:api_task/mobigic/routes.dart';
import 'package:api_task/mobigic/ui/create_grid_page.dart';
import 'package:api_task/mobigic/ui/mobigic_home_page.dart';
import 'package:api_task/mobigic/ui/mobigic_splash_page.dart';
import 'package:api_task/mobigic/ui/rows_and_columns_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashPageRoute:
        return MaterialPageRoute(
          builder: (_) => const MobigicSplashPage(),
        );
      case Routes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => const MobigicHomePage(),
        );
      case Routes.rowAndColumnPageRoute:
        return MaterialPageRoute(
          builder: (_) => const RowsAndColumnsInputPage(),
        );
      case Routes.createGridPageRoute:
        return MaterialPageRoute(
          builder: (_) => const CreateGridPage(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Error Route'),
          ),
        );
      },
    );
  }
}
