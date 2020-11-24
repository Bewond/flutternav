<p align="center">
<img src="/docs/assets/flutternav.png" width="100%" alt="Flutternav" />
</p>

## Overview
A library for [Flutter](https://flutter.dev/) to simplify the use of the [navigation and routing system](https://flutter.dev/docs/development/ui/navigation) that it works consistently on all platforms, including the web.


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
  firebloc:
    git:
      url: git://github.com/bewond/firebloc.git
      path: firebloc
```
#### Install
You can install packages from the command line:
```shell
flutter pub get
```

## Documentation
### Example of BaseRepository
This example shows how to use BaseRepository to retrieve data from a collection by creating only the data model.
