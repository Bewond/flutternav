import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

//

class AppInformationParser extends RouteInformationParser<NavPath> {
  final NavConfiguration configuration;

  AppInformationParser(this.configuration);

  @override
  Future<NavPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    return configuration.parseRoute(routeInformation);
  }

  @override
  RouteInformation restoreRouteInformation(NavPath path) {
    return configuration.restoreRoute(path);
  }
}
