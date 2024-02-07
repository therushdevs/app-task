import 'package:api_task/the_gig_search/gig_splash_page.dart';
import 'package:api_task/the_gig_search/routing/route_generator.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GigMyApp extends StatefulWidget {
  const GigMyApp({super.key});

  @override
  State<GigMyApp> createState() => _GigMyAppState();
}

class _GigMyAppState extends State<GigMyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStatePropertyAll(0),
            // backgroundColor: const MaterialStatePropertyAll(
            //     Color.fromARGB(255, 143, 157, 247)),
            // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //   RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(6.0),
            //     side: BorderSide(
            //       color: Colors.blue.shade700,
            //       width: 2.5,
            //       style: BorderStyle.solid,
            //     ),
            //   ),
            // ),
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
      home: const GigSplashPage(),
    );
  }
}
