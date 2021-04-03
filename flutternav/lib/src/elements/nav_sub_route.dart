import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutternav/src/elements/nav_element.dart';

class NavSubRoute extends NavElement<VRouteElement> {
  final String? path;
  final Widget Function(Widget) build;
  final List<NavElement> nested;
  final String? name;
  final List<String> aliases;

  const NavSubRoute({
    required this.path,
    required this.build,
    required this.nested,
    this.name,
    this.aliases = const [],
  });

  @override
  VRouteElement get baseElement {
    return VNester(
      path: path,
      widgetBuilder: build,
      nestedRoutes: NavElement.toBaseElements(nested),
      name: name,
      aliases: aliases,
    );
  }
}
