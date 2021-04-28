import 'package:flutter/widgets.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutternav/src/elements/nav_element.dart';

/// See [NavRouter.routerMode].
enum NavRouterModes { hash, history }

/// Flutternav uses [NavRouter] to configure the routing settings.
///
/// You can pass it several parameters like [routes] to define
/// the app routes through the use of [NavElement] objects.
class NavRouter {
  /// List containing all the routes of the app.
  final List<NavElement> routes;

  /// Allows you to change the initial url.
  ///
  /// The default value is '/'.
  final String initialUrl;

  /// Two router mode are possible:
  /// - NavRouterModes.hash: This is the default, the url will be "serverAddress/#/localUrl".
  /// - NavRouterModes.history: This will display the url in the way we are used to, without the "#".
  ///
  /// However note that you will need to configure your server to make this work.
  final NavRouterModes routerMode;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  late final RouterDelegate<RouteInformation> routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  late final RouteInformationParser<RouteInformation> routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  late final RootBackButtonDispatcher backButtonDispatcher;

  NavRouter({
    required this.routes,
    this.initialUrl = '/',
    this.routerMode = NavRouterModes.hash,
  }) {
    routerDelegate = VRouterDelegate(
      routes: NavElement.toBaseElements(routes),
      initialUrl: initialUrl,
      mode: routerMode == NavRouterModes.hash
          ? VRouterModes.hash
          : VRouterModes.history,
    );

    routeInformationParser = VRouteInformationParser();
    backButtonDispatcher = VBackButtonDispatcher();
  }
}
