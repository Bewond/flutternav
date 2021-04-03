import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutternav/src/elements/nav_element.dart';

/// A [NavElement] which enable to to map a [path] to a [widget] to display.
///
/// Widgets can be stacked on top of each other using the [stacked] parameter.
/// Also see [NavSubRoute] if you want to widget nesting instead of stacking.
class NavRoute extends NavElement<VRouteElement> {
  final String? path;
  final Widget widget;
  final List<NavElement> stacked;
  final String? name;
  final List<String> aliases;

  const NavRoute({
    required this.path,
    required this.widget,
    this.stacked = const [],
    this.name,
    this.aliases = const [],
  });

  @override
  VRouteElement get baseElement {
    return VWidget(
      path: path,
      widget: widget,
      stackedRoutes: NavElement.toBaseElements(stacked),
      name: name,
      aliases: aliases,
    );
  }
}
