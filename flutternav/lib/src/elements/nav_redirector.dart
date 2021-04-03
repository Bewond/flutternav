import 'package:vrouter/vrouter.dart';

import 'package:flutternav/src/elements/nav_element.dart';

class NavRedirector extends NavElement<VRouteElement> {
  final String path;
  final String redirect;

  const NavRedirector({
    required this.path,
    required this.redirect,
  });

  @override
  VRouteElement get baseElement {
    return VRouteRedirector(
      path: path,
      redirectTo: redirect,
    );
  }
}
