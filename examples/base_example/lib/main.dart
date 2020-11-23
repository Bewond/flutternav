import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

import 'package:navigator_example/paths.dart';
import 'package:uri/uri.dart';

/*
* 23/11/2020
* On the web, if you reload the page in development mode, it takes you back
* to the initial page. This behavior does not occur in release mode.
* (flutter run --release -d chrome)
* */

void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavConfiguration nav = NavConfiguration(
      initialPath: StartPath(),
      parseRoute: _parseRoute,
      onChange: _changePageStack,
    );

    return MaterialApp.router(
      title: 'Flutternav Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: nav.routerDelegate,
      routeInformationParser: nav.informationParser,
    );
  }

  void _changePageStack(List<Page> pages) {
    print(pages.map((page) => page.name).toList());
  }

  NavPath _parseRoute(RouteInformation information) {
    var uri = Uri.parse(information.location);

    // Test
    var template = UriTemplate("/details/{id}");
    var parser = UriParser(template);
    if (parser.matches(uri)) {
      var params = parser.parse(uri);
      print("params: $params");
    }

    // Handle '/'
    if (uri.pathSegments.isEmpty) return StartPath();
    // Handle '/details/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'details') {
        var id = int.tryParse(uri.pathSegments[1]);
        if (id != null) return DetailsPath(id: id);
      }
    }
    // Handle unknown routes
    return UnknownPath();
  }
}
