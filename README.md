<p align="center">
<img src="/docs/assets/flutternav.png" width="100%" alt="Flutternav" />
</p>

## Overview
A library for [Flutter](https://flutter.dev/) to simplify the use of the [navigation and routing system](https://flutter.dev/docs/development/ui/navigation) that it works consistently on all platforms, including the web.
It builds on the features offered by the new API [Navigator 2.0](https://docs.google.com/document/d/1Q0jx0l4-xymph9O6zLaOY4d_f7YFpNWX_eGbzYxr9wY/edit#heading=h.l6kdsrb6j9id) which allows for more precise control over app screens and how to analyze routes.

> Currently on the web, if you reload the page in development mode, it takes you back to the initial page. This behavior does not occur in release mode. (flutter run --release -d chrome)

(Currently in beta)

- [Installing](#installing)
- [Documentation](#documentation)
  * [Base example](#base-example)
- [Maintainers](#maintainers)


## Installing
#### Depend
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  flutternav:
    git:
      url: git://github.com/bewond/flutternav.git
      path: flutternav
```
#### Install
You can install packages from the command line:
```shell
flutter pub get
```

## Documentation
### Base example
This example shows how to use Flutternav in a simple app.

**App screens** (`paths.dart`): \
Define the classes that represent the app screens, they must extends from `NavPath`.
```dart
import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

//...

class StartPath extends NavPath {
  StartPath() : super(name: '/', widget: MainScreen());
}

class UnknownPath extends NavPath {
  UnknownPath() : super(name: '/404', widget: UnknownScreen());
}

class DetailsPath extends NavPath {
  final int id;

  DetailsPath({@required this.id})
      : super(name: '/details/$id', widget: DetailsScreen(id: id));
}
```

For each screen you need to specify the unique name and a widget plus additional parameters if needed.

**Main** (`main.dart`): \
Define a `NavConfiguration` object and specify the `parseRoute` function and the `initialPath` parameter. \
Then the `routerDelegate` and the `informationParser` contained in the configuration are passed to a widget like `MaterialApp.router` or `CupertinoApp.router`.

```dart
class TheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavConfiguration nav = NavConfiguration(
      initialPath: StartPath(),
      parseRoute: _parseRoute,
      onChange: _changePageStack,
    );

    return MaterialApp.router(
      title: 'Flutternav Demo',
      debugShowCheckedModeBanner: false,
      routerDelegate: nav.routerDelegate,
      routeInformationParser: nav.informationParser,
    );
  }

  void _changePageStack(List<Page> pages) {
    print(pages.map((page) => page.name).toList());
  }

  NavPath _parseRoute(RouteInformation information) {
    var uri = Uri.parse(information.location);
    
    //Handle '/'
    if (uri.pathSegments.isEmpty) return StartPath();
    //Handle '/details/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'details') {
        var id = int.tryParse(uri.pathSegments[1]);
        if (id != null) return DetailsPath(id: id);
      }
    }
    //Handle unknown routes
    return UnknownPath();
  }
}
```

To simplify the writing of `parseRoute` function you can use the methods of the [Uri class](https://api.dart.dev/stable/2.10.4/dart-core/Uri-class.html) provided by dart.

**Navigate** (`main_screen.dart`, `details_screen.dart`): \
Methods available to navigate between app screens.

Open a new screen:
```dart
NavManager.of(context).push(DetailsPath(id: 1));
```
Remove the last opened screen:
```dart
NavManager.of(context).pop();
```
Return to a previously added screen (removes all screens other than the one specified):
```dart
NavManager.of(context).revert(StartPath());
```

---

## Maintainers
- [Riccardo Brero](https://github.com/Riki1312)
