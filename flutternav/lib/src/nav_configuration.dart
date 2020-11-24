import 'package:flutter/material.dart';

import 'package:flutternav/flutternav.dart';
import 'package:flutternav/src/router/app_information_parser.dart';
import 'package:flutternav/src/router/app_router_delegate.dart';

/*
* NavConfiguration takes care of instantiating AppRouterDelegate and
* AppInformationParser and containing the information they need.
* */

class NavConfiguration {
  //The first path in the list of NavManager pages.
  final NavPath initialPath;
  //Converts the given route information into NavPath.
  final NavPath Function(RouteInformation) parseRoute;
  //Restore the route information from the given NavPath.
  RouteInformation Function(NavPath) restoreRoute;
  //Called whenever the Navigator is rebuilt (useful for debugging purposes).
  void Function(List<Page>) onChange;

  AppRouterDelegate routerDelegate;
  AppInformationParser informationParser;

  NavConfiguration({
    @required this.initialPath,
    @required this.parseRoute,
    this.restoreRoute,
    this.onChange,
  }) {
    restoreRoute ??= _restoreRouteDefault;
    onChange ??= (_) {};

    routerDelegate = AppRouterDelegate(this);
    informationParser = AppInformationParser(this);
  }

  RouteInformation _restoreRouteDefault(NavPath path) {
    return RouteInformation(location: path.name);
  }
}
