import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutternav/flutternav.dart';

//

class AppRouterDelegate extends RouterDelegate<NavPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavPath> {
  final NavManager manager;
  final void Function(List<Page>) onChange;

  AppRouterDelegate(NavConfiguration configuration)
      : manager = NavManager(configuration),
        onChange = configuration.onChange {
    manager.addListener(notifyListeners);
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => manager.navigatorKey;

  @override
  NavPath get currentConfiguration => manager.currentPath;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavManager>.value(
      value: manager,
      child: Consumer<NavManager>(
        builder: (context, manager, child) {
          // If the function is defined notify the change.
          onChange?.call(List.of(manager.pages));

          return Navigator(
            key: navigatorKey,
            onPopPage: _onPopPage,
            pages: List.of(manager.pages),
          );
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(NavPath path) async {
    await manager.push(path);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;

    manager.remove(route.settings);
    return true;
  }
}
