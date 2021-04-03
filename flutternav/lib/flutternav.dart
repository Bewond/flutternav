/// A Flutter package to simplify the use of the navigation and routing system that works consistently across all platforms.
///
/// Flutternav uses [NavRouterApp] instead of [MaterialApp] or [CupertinoApp],
/// with the parameter [NavRouterApp.routes] it is possible to define
/// the routes of the app through the use of [NavElement] objects.
library flutternav;

export 'package:flutternav/src/nav_data.dart';

export 'package:flutternav/src/elements/nav_redirector.dart';
export 'package:flutternav/src/elements/nav_route.dart';
export 'package:flutternav/src/elements/nav_sub_route.dart';

export 'package:flutternav/src/widgets/nav_router_app.dart';
