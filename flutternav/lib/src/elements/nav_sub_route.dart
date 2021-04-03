import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutternav/src/elements/nav_element.dart';

/// A [NavElement] which enable nesting.
///
/// The [build] function exposes a [Widget] which should be used as a child to nest.
/// This [Widget] will be the one present in [nested] corresponding to the current route.
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
