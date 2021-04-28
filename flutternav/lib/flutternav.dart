/// A Flutter package to simplify the use of the navigation and routing system
/// that works consistently across all platforms.
///
/// Flutternav uses [NavRouter] to configure the routing settings,
/// with the parameter [NavRouter.routes] it is possible to define
/// the routes of the app through the use of [NavElement] objects.
///
/// Then it is necessary to use the [MaterialApp.router] widget (or equivalent)
/// and pass it the information from the previously defined [NavRouter] object using
/// the [routeInformationParser], [routerDelegate] and [backButtonDispatcher] parameters.
library flutternav;

export 'package:flutternav/src/elements/nav_redirector.dart';
export 'package:flutternav/src/elements/nav_route.dart';
export 'package:flutternav/src/elements/nav_sub_route.dart';

export 'package:flutternav/src/nav_data.dart';
export 'package:flutternav/src/nav_router.dart';
