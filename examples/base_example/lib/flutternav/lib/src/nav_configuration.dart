import 'package:flutter/material.dart';

import 'package:flutternav/flutternav.dart';
import 'package:flutternav/src/router/app_information_parser.dart';
import 'package:flutternav/src/router/app_router_delegate.dart';

//

class NavConfiguration {
  final NavPath initialPath;
  final NavPath Function(RouteInformation) parseRoute;
  RouteInformation Function(NavPath) restoreRoute;
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

  static RouteInformation _restoreRouteDefault(NavPath path) {
    return RouteInformation(location: path.name);
  }
}
