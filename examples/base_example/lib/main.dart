import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

import 'package:base_example/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavRouter router = NavRouter(
      routes: [
        NavRoute(
          path: '/',
          widget: MainScreen(),
          stacked: [
            NavRoute(path: 'details/:id', widget: DetailsScreen()),
          ],
        ),
        NavSubRoute(
          path: '/menu',
          build: (child) => MenuScreen(page: child),
          nested: [
            NavRoute(path: 'page1', widget: Page1()),
            NavRoute(path: 'page2', widget: Page2()),
          ],
        ),
        NavRoute(path: '/404', widget: UnknownScreen()),
        NavRedirector(path: ':_(.+)', redirect: '/404'),
      ],
      initialUrl: '/',
      routerMode: NavRouterModes.hash,
    );

    return MaterialApp.router(
      title: 'Flutternav Demo',
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      backButtonDispatcher: router.backButtonDispatcher,
    );
  }
}
