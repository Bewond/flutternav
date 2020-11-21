import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

//

class NavConfiguration {
  final NavPath initialPath;
  final NavPath Function(RouteInformation) parseRoute;
  final RouteInformation Function(NavPath) restoreRoute;

  AppRouterDelegate routerDelegate;
  AppInformationParser informationParser;

  NavConfiguration({
    @required this.initialPath,
    @required this.parseRoute,
    @required this.restoreRoute,
  }) {
    routerDelegate = AppRouterDelegate(this);
    informationParser = AppInformationParser(this);
  }
}
