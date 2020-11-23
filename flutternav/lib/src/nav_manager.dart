import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutternav/flutternav.dart';

//

class NavManager extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final List<Page> pages = [];
  final NavConfiguration configuration;

  static NavManager of(BuildContext context) {
    return Provider.of<NavManager>(context, listen: false);
  }

  NavPath get currentPath => configuration.parseRoute(RouteInformation(
        location: pages.last.name,
      ));

  NavManager(this.configuration) {
    pages.add(configuration.initialPath.page);
  }

  Future<void> push(NavPath path) async {
    /*
    * The initial page is already in the page list so if you push
    * the initial page just revert to remove all other pages.
    * (It also solves the case of two initial pages overlapping at the first opening.)
    * */
    if (path.name == configuration.initialPath.name)
      revert(path);
    else
      pages.add(path.page);

    notifyListeners();
  }

  Future<void> pop(Page page) async {
    pages.remove(page);
    notifyListeners();
  }

  Future<void> revert(NavPath path) async {
    pages.removeWhere((element) => element.name != path.name);
    notifyListeners();
  }
}
