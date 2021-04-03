import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

extension NavContext on BuildContext {
  NavData get nav => NavData(this);
}

class NavData {
  final BuildContext _buildContext;

  const NavData(this._buildContext);

  /// Maps all route parameters of the current url.
  ///
  /// Note that if you have multiple parameters
  /// with the same name,only the last one will be visible.
  Map<String, String> get pathData => _buildContext.vRouter.pathParameters;

  /// Maps all query parameters of the current url.
  Map<String, String> get queryData => _buildContext.vRouter.queryParameters;

  /// This state is saved in the browser history.
  ///
  /// This means that if the user presses the back or forward button on the navigator,
  /// this [historyState] will be the same as the last one you saved.
  Map<String, String> get historyState => _buildContext.vRouter.historyState;

  /// Removes the current route from the route stack.
  void pop({
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
    Map<String, String> newHistoryState = const {},
  }) {
    _buildContext.vRouter.pop(
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      newHistoryState: newHistoryState,
    );
  }

  /// Pushes the new route of the given url on top of the current one.
  ///
  /// A path can be of one of two forms:
  /// - Stating with '/', in which case we just navigate to the given path.
  /// - Not starting with '/', in which case we append the current path to the given one.
  void push(
    String newUrl, {
    Map<String, String> queryParameters = const {},
    Map<String, String> historyState = const {},
  }) {
    _buildContext.vRouter.push(
      newUrl,
      queryParameters: queryParameters,
      historyState: historyState,
    );
  }

  /// Updates the url given a [NavElement] name.
  ///
  /// You can also specify path parameters to inject into the new path.
  void pushNamed(
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
    Map<String, String> historyState = const {},
  }) {
    _buildContext.vRouter.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      historyState: historyState,
    );
  }

  /// Replace the current one by the new route corresponding to the given url.
  ///
  /// The difference with [push] is that this overwrites the current browser history entry.
  /// (If you are on mobile, this is the same as push).
  ///
  /// A path can be of one of two forms:
  /// - Stating with '/', in which case we just navigate to the given path.
  /// - Not starting with '/', in which case we append the current path to the given one.
  void pushReplacement(
    String newUrl, {
    Map<String, String> queryParameters = const {},
    Map<String, String> historyState = const {},
  }) {
    _buildContext.vRouter.pushReplacement(
      newUrl,
      queryParameters: queryParameters,
      historyState: historyState,
    );
  }

  /// Replace the url given a [NavElement] name.
  ///
  /// The difference with [pushNamed] is that this overwrites the current browser history entry.
  /// (If you are on mobile, this is the same as pushNamed).
  ///
  /// You can also specify path parameters to inject into the new path.
  void pushReplacementNamed(
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
    Map<String, String> historyState = const {},
  }) {
    _buildContext.vRouter.pushReplacementNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      historyState: historyState,
    );
  }

  /// Goes to an url which is not in the app.
  ///
  /// On the web, you can set [openNewTab] to open this url in a new tab.
  void pushExternal(
    String newUrl, {
    bool openNewTab = false,
  }) {
    _buildContext.vRouter.pushExternal(
      newUrl,
      openNewTab: openNewTab,
    );
  }
}
