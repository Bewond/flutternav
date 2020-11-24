<p align="center">
<img src="/docs/assets/flutternav.png" width="100%" alt="Flutternav" />
</p>

## Overview
A library for [Flutter](https://flutter.dev/) to simplify the use of the [navigation and routing system](https://flutter.dev/docs/development/ui/navigation) that it works consistently on all platforms, including the web.
It builds on the features offered by the new API [Navigator 2.0](https://docs.google.com/document/d/1Q0jx0l4-xymph9O6zLaOY4d_f7YFpNWX_eGbzYxr9wY/edit#heading=h.l6kdsrb6j9id) which allows for more precise control over app screens and how to analyze routes.

(Currently in beta)


- [Overview](#overview)
- [Installing](#installing)
- [Documentation](#documentation)
  * [Example of BaseRepository](#example-of-baserepository)
  * [Example with a custom repository](#example-with-a-custom-repository)
  * [Advanced use case](#advanced-use-case)
  * [FireblocUtilities](#fireblocutilities)
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

**App paths** (`paths.dart`): \
Define the classes that represent the app paths, they must extends from `NavPath`.
```
import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

//...

class StartPath extends NavPath {
  StartPath() : super(name: '/', widget: MainScreen());
}

class UnknownPath extends NavPath {
  UnknownPath() : super(name: '404', widget: UnknownScreen());
}

class DetailsPath extends NavPath {
  final int id;

  DetailsPath({@required this.id})
      : super(name: 'details/$id', widget: DetailsScreen(id: id));
}
```
