import 'package:flutter/material.dart';

/*
* Base class from which the data types representing the paths in the app extend.
* */

@immutable
abstract class NavPath {
  //Unique path name.
  final String name;
  //The screen widget of the path.
  final Widget widget;
  //Immutable object used to set the NavManager pages list.
  final Page page;

  NavPath({
    @required this.name,
    @required this.widget,
  }) : page = MaterialPage(child: widget, key: UniqueKey(), name: name);
}
