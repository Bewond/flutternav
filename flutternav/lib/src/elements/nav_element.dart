import 'package:flutter/material.dart';

@immutable
abstract class NavElement<T> {
  const NavElement();

  T get baseElement;

  static List<T> toBaseElements<T>(List<NavElement> elements) {
    List<T> result = [];
    for (var element in elements) result.add(element.baseElement);

    return result;
  }
}
