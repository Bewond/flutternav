<p align="center">
<img src="/docs/assets/flutternav.png" width="100%" alt="Flutternav" />
</p>

## Overview
A library for [Flutter](https://flutter.dev/) to simplify the use of the [navigation and routing system](https://flutter.dev/docs/development/ui/navigation) that it works consistently on all platforms, including the web.
It builds on the features offered by the new API [Navigator 2.0](https://docs.google.com/document/d/1Q0jx0l4-xymph9O6zLaOY4d_f7YFpNWX_eGbzYxr9wY/edit#heading=h.l6kdsrb6j9id) which allows for more precise control over app screens and how to analyze routes.

Flutternav starting from version 0.2.0 is built on the basis of the excellent [VRouter](https://github.com/lulupointu/vrouter) package.
However it implements a subset of the features offered by VRouter, the goal is to keep a constant user-side API even though Flutternav may be based on a different implementation in the future.

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

**Main** (`main.dart`): \
Use `NavRouterApp` instead of `MaterialApp` or `CupertinoApp`, you can pass all parameters you would normally use with `MaterialApp` plus some new ones:
- `routes`: list of `NavElement` elements to define routes (required)
- `initialUrl`: the initial path (default: '/')
- `routerMode`: `NavRouterModes.hash` or `NavRouterModes.history`:
  * "hash": This is the default, the url will be serverAddress/#/localUrl
  * "history": This will display the url in the way we are used to, without the #. However note that you will need to configure your server to make this work. 

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavRouterApp(
      title: 'Flutternav Demo',
      debugShowCheckedModeBanner: false,
      routerMode: NavRouterModes.history,
      routes: [
        NavRoute(
          path: '/',
          widget: MainScreen(),
          stacked: [
            NavRoute(path: 'details/:id', widget: DetailsScreen()),
          ],
        ),
        NavSubRoute(
          path: '/menu',
          build: (child) => MenuScreen(page: child),
          nested: [
            NavRoute(path: 'page1', widget: Page1()),
            NavRoute(path: 'page2', widget: Page2()),
          ],
        ),
        NavRoute(path: '/404', widget: UnknownScreen()),
        NavRedirector(path: ':_(.+)', redirect: '/404'),
      ],
    );
  }
}
```

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
