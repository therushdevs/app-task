import 'package:api_task/the_gig_search/gig_splash_page.dart';
import 'package:api_task/the_gig_search/providers/create_account_provider.dart';
import 'package:api_task/the_gig_search/providers/sso_provider.dart';
import 'package:api_task/the_gig_search/routing/route_generator.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:api_task/the_gig_search/ui/gig_create_account_page.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GigMyApp extends StatefulWidget {
  const GigMyApp({super.key});

  @override
  State<GigMyApp> createState() => _GigMyAppState();
}

class _GigMyAppState extends State<GigMyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SsoProvider>(
          create: (context) => SsoProvider(),
        ),
        ChangeNotifierProvider<CreateAccountProvider>(
          create: (context) => CreateAccountProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navKey,
        initialRoute: Routes.gigSplashPageRoute,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 245, 248, 250),
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            foregroundColor: Colors.black,
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 245, 248, 250),
            titleTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(55),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(
              color: Colors.blue,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.grey,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        // home: const GigSplashPage(),
      ),
    );
  }
}
