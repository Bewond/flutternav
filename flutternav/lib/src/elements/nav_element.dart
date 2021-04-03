import 'package:flutter/material.dart';

@immutable
abstract class NavElement<T> {
  const NavElement();

  T get baseElement;

  static List<T> toBaseElements<T>(List<NavElement> elements) {
    var result = <T>[];
    for (var element in elements) {
      result.add(element.baseElement);
    }

    return result;
  }
}
