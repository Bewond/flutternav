import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

extension NavContext on BuildContext {
  NavData get nav => NavData(this);
}

class NavData {
  final BuildContext _buildContext;

  const NavData(this._buildContext);

  Map<String, String> get pathData => _buildContext.vRouter.pathParameters;

  Map<String, String> get queryData => _buildContext.vRouter.queryParameters;

  Map<String, String> get historyState => _buildContext.vRouter.historyState;

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
