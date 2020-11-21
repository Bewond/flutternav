import 'package:flutter/material.dart';

//

@immutable
abstract class NavPath {
  final String name;
  final Widget widget;
  final Page page;

  NavPath({
    @required this.name,
    @required this.widget,
  }) : page = MaterialPage(child: widget, key: UniqueKey(), name: name);
}
