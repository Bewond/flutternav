import 'package:flutter/widgets.dart';

/// Base abstract class which is used to implement several [NavElement].
///
/// (This class should not be used directly outside the Flutternav package).
@immutable
abstract class NavElement<T> {
  const NavElement();

  /// Element of type [T] used in low-level implantation.
  T get baseElement;

  /// Static method to get a list of [baseElement] from one of [NavElement].
  static List<T> toBaseElements<T>(List<NavElement> elements) {
    var result = <T>[];
    for (var element in elements) {
      result.add(element.baseElement);
    }

    return result;
  }
}
