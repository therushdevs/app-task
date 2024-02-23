import 'package:api_task/cognota/routing/routes.dart';
import 'package:api_task/cognota/ui/create_task_page.dart';
import 'package:api_task/cognota/ui/home_page_cognota.dart';
import 'package:flutter/material.dart';

class CognotaApp extends StatelessWidget {
  const CognotaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: cNavKey,
      onGenerateRoute: (settings) {
        final routeNames = settings.name;
        switch (routeNames) {
          case Routes.splashPageRoute:
            return MaterialPageRoute(
              builder: (context) => const HomePageCognota(),
            );

          case Routes.homePageRoute:
            return MaterialPageRoute(
              builder: (context) => const HomePageCognota(),
            );

          case Routes.createTaskPageRoute:
            return MaterialPageRoute(
              builder: (context) => const CreateTaskPage(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(
                  child: Text('/error_route'),
                ),
              ),
            );
        }
      },
      // home: HomePageCognota(),
      initialRoute: Routes.splashPageRoute,
    );
  }
}
