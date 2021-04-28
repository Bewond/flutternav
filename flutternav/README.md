# Flutternav

A library for [Flutter](https://flutter.dev/) to simplify the use of the [navigation and routing system](https://flutter.dev/docs/development/ui/navigation) that it works consistently on all platforms, including the web.
It builds on the features offered by the new API [Navigator 2.0](https://docs.google.com/document/d/1Q0jx0l4-xymph9O6zLaOY4d_f7YFpNWX_eGbzYxr9wY/edit#heading=h.l6kdsrb6j9id) which allows for more precise control over app screens and how to analyze routes.

Flutternav starting from version `0.3.0` is built on the basis of the excellent [VRouter](https://github.com/lulupointu/vrouter) package.
However it implements a subset of the features offered by VRouter, the goal is to keep a constant user-side API even though Flutternav may be based on a different implementation in the future.

(Currently in beta)

- [Documentation](#documentation)
  * [NavElement objects](#navelement-objects)
  * [Path parameters](#path-parameters)
  * [Navigate](#navigate)
  * [Named route](#named-route)
- [Maintainers](#maintainers)

## Documentation

Flutternav uses `NavRouter` to configure the routing settings,
you can pass several parameters like `routes` to define the app routes through the use of `NavElement` objects.

Then it is necessary to use the `MaterialApp.router` widget (or equivalent) and pass it the information from the previously defined `NavRouter` object using the `routeInformationParser`, `routerDelegate` and `backButtonDispatcher` parameters.

```dart
class MyApp extends StatelessWidget {
  NavRouter router = NavRouter(
    routes: [
      NavRoute(path: '/', widget: MainScreen()),
      NavRoute(path: '/404', widget: UnknownScreen()),
      NavRedirector(path: ':_(.+)', redirect: '/404'),
    ],
    initialUrl: '/',
    routerMode: NavRouterModes.history,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutternav Demo',
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      backButtonDispatcher: router.backButtonDispatcher,
    );
  }
}
```

### NavElement

`NavElement` objects are used to define routes and implement various functionalities.

**NavRoute** \
Used to display the given widget if the path is matched, you can stack widget from other `NavElement` on top of the given widget.
```dart
NavRoute(
  path: '/',
  widget: MainScreen(),
  stacked: [
    NavRoute(path: 'details/:id', widget: DetailsScreen()),
  ],
)
```

**NavSubRoute** \
Used to nest widgets. In this example, the MenuScreen widget receives a different page as a child depending on the path.
```dart
NavSubRoute(
  path: '/menu',
  build: (child) => MenuScreen(page: child),
  nested: [
    NavRoute(path: 'page1', widget: Page1()),
    NavRoute(path: 'page2', widget: Page2()),
  ],
),
```

**NavRedirector** \
Used to redirect specific paths to another.

```dart
NavRedirector(
  path: ':_(.+)', // Matches any path
  redirect: '/404',
),
```

### Path parameters

To use the path parameters just add ":paramName" to the route path:
```dart
NavRoute(
  path: 'details/:id',
  widget: DetailsScreen(),
),
```

To retrieve the parameter value in the widget:
```dart
String? id = context.nav.pathData['id'];
```

### Navigate

Available methods for navigating between routes.

Pushing a path, is relative if you omit the "/":
```dart
context.nav.push('/menu/page1');
```
Pushing a named route:
```dart
context.nav.pushNamed('page1');
```
Pushing an external url:
```dart
context.nav.pushExternal('https://www.google.com/');
```

### Named route
Naming a route for easier navigation using the name attribute of any `NavElement` that has a path.

### NavRouterModes
With the `routerMode` parameter of `NavRouter` you can choose between:

- `NavRouterModes.hash`: This is the default, the url will be "serverAddress/#/localUrl"
- `NavRouterModes.history`: This will display the url in the way we are used to, without the "#". However note that you will need to [configure your server](https://router.vuejs.org/guide/essentials/history-mode.html#example-server-configurations) to make this work.

---

## Maintainers
- [Riccardo Brero](https://github.com/Riki1312)
