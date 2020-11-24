import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

//

class AppInformationParser extends RouteInformationParser<NavPath> {
  final NavConfiguration configuration;

  const AppInformationParser(this.configuration);

  //Converts the given route information into parsed data to pass to a RouterDelegate.
  @override
  Future<NavPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    return configuration.parseRoute(routeInformation);
  }

  //Restore the route information from the given configuration.
  @override
  RouteInformation restoreRouteInformation(NavPath path) {
    return configuration.restoreRoute(path);
  }
}
