import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutternav/src/elements/nav_element.dart';

/// See [NavRouterApp.routerMode].
enum NavRouterModes { hash, history }

/// Flutternav use [NavRouterApp] instead of [MaterialApp] or [CupertinoApp].
///
/// You can pass all the parameters you would normally use plus some new ones
/// like [routes] to define the app routes through the use of [NavElement] objects.
class NavRouterApp extends StatelessWidget {
  /// List containing all the paths of the app.
  final List<NavElement> routes;

  /// This allows you to change the initial url.
  ///
  /// The default value is '/'.
  final String initialUrl;

  /// Two router mode are possible:
  /// - NavRouterModes.hash: This is the default, the url will be "serverAddress/#/localUrl".
  /// - NavRouterModes.history: This will display the url in the way we are used to, without the "#".
  ///
  /// However note that you will need to configure your server to make this work.
  final NavRouterModes routerMode;

  // MaterialApp parameters
  final BackButtonDispatcher? backButtonDispatcher;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final ThemeMode? themeMode;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final bool? debugShowMaterialGrid;

  const NavRouterApp({
    Key? key,
    required this.routes,
    this.initialUrl = '/',
    this.routerMode = NavRouterModes.hash,
    // MaterialApp parameters
    this.backButtonDispatcher,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      key: key,
      routes: NavElement.toBaseElements(routes),
      initialUrl: initialUrl,
      mode: routerMode == NavRouterModes.hash
          ? VRouterModes.hash
          : VRouterModes.history,
      // MaterialApp parameters
      backButtonDispatcher: backButtonDispatcher,
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme,
      darkTheme: darkTheme,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
    );
  }
}
