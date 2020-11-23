import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:flutternav/flutternav.dart';

import 'package:navigator_example/screens/details_screen.dart';
import 'package:navigator_example/screens/main_screen.dart';
import 'package:navigator_example/screens/unknown_screen.dart';

//

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
