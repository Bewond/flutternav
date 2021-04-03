import 'package:vrouter/vrouter.dart';

import 'package:flutternav/src/elements/nav_element.dart';

/// A [NavElement] which enable to redirect from [path] to [redirect].
///
/// Note that this uses [pushReplacement] so if you are on the web,
/// [path] will not appear in the web history once redirected.
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
