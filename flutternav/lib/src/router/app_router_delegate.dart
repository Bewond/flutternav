import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutternav/flutternav.dart';

/*
* AppRouterDelegate builds the Navigator with the current list of pages
* based on the AppInformationParser and the status of the app.
* */

class AppRouterDelegate extends RouterDelegate<NavPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavPath> {
  final NavManager manager;
  final void Function(List<Page>) onChange;

  AppRouterDelegate(NavConfiguration configuration)
      : manager = NavManager(configuration),
        onChange = configuration.onChange {
    //Pass the notification from NavManager to RouterDelegate.
    manager.addListener(notifyListeners);
  }

  //The key used for retrieving the current navigator.
  @override
  GlobalKey<NavigatorState> get navigatorKey => manager.navigatorKey;

  //In web applications, is used for populating browser history in order to support the forward and the backward buttons.
  @override
  NavPath get currentConfiguration => manager.currentPath;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavManager>.value(
      value: manager,
      child: Consumer<NavManager>(
        builder: (context, manager, child) {
          //If the function is defined notify the change.
          onChange?.call(List.of(manager.pages));

          //Return Navigator using navigatorKey.
          return Navigator(
            key: navigatorKey,
            onPopPage: _onPopPage,
            pages: List.of(manager.pages),
          );
        },
      ),
    );
  }

  //Called when a new path has been sent to the application by the operating system.
  @override
  Future<void> setNewRoutePath(NavPath path) async {
    await manager.push(path);
  }

  //Allows the Navigator to pop a page (return a boolean value to indicate whether this delegate handles the request).
  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;

    manager.remove(route.settings);
    return true;
  }
}
