import 'package:api_task/mobigic/providers/grid_provider.dart';
import 'package:api_task/mobigic/route_generator.dart';
import 'package:api_task/mobigic/routes.dart';
import 'package:api_task/mobigic/ui/mobigic_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobigicApp extends StatelessWidget {
  const MobigicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GridProvider>(
          create: (_) => GridProvider(),
        )
      ],
      child: MaterialApp(
        navigatorKey: navKey,
        initialRoute: Routes.splashPageRoute,
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
        home: const MobigicHomePage(),
      ),
    );
  }
}
