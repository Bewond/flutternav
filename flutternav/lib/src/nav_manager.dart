import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutternav/flutternav.dart';

/*
* NavManager manages the list of pages that AppRouterDelegate uses to build
* the Navigator widget and exposes the methods needed to manipulate this list.
* */

class NavManager extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final List<Page> pages = [];
  final NavConfiguration configuration;

  //Static method for accessing to the NavManager.
  static NavManager of(BuildContext context) {
    return Provider.of<NavManager>(context, listen: false);
  }

  NavPath get currentPath => configuration.parseRoute(RouteInformation(
        location: pages.last.name,
      ));

  NavManager(this.configuration) {
    pages.add(configuration.initialPath.page);
  }

  //Add a new page of the specific path.
  Future<void> push(NavPath path) async {
    /*
    * The initial page is already in the page list so if you push
    * the initial page just revert to remove all other pages.
    * (It also solves the case of two initial pages overlapping at the first opening.)
    * */
    if (path.name == configuration.initialPath.name) {
      await revert(path);
    } else {
      pages.add(path.page);
    }

    notifyListeners();
  }

  //Remove the last page.
  Future<void> pop() async {
    pages.removeLast();
    notifyListeners();
  }

  //Remove a specific page.
  Future<void> remove(Page page) async {
    pages.remove(page);
    notifyListeners();
  }

  //Removes all pages other than the one specified by the path.
  Future<void> revert(NavPath path) async {
    pages.removeWhere((element) => element.name != path.name);
    notifyListeners();
  }
}
