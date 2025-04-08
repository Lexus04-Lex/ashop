import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ADeviceUtils {
  /// Standard height for app bars (matches Material Design's kToolbarHeight)
  static const double appBarHeight = kToolbarHeight; // 56.0

  /// Standard height for bottom navigation bars (matches Material Design's kBottomNavigationBarHeight)
  static const double bottomNavBarHeight = kBottomNavigationBarHeight; // 56.0

  /// Hides the keyboard if it's open
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Sets the status bar color
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// Checks if device is in landscape orientation
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// Checks if device is in portrait orientation
  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// Sets the status bar color and icons brightness
  static void setSystemUIOverlayStyle({
    Color statusBarColor = Colors.transparent,
    Brightness statusBarBrightness = Brightness.dark,
    Brightness statusBarIconBrightness = Brightness.light,
    Color systemNavigationBarColor = Colors.white,
    Brightness systemNavigationBarIconBrightness = Brightness.dark,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
      ),
    );
  }

  /// Gets the screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Gets the screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Gets the available screen height (excluding status bar, app bar, and optionally bottom nav bar)
  static double getAvailableScreenHeight(
      BuildContext context, {
        double appBarHeight = appBarHeight, // Uses the constant by default
        bool includeBottomNavBar = true,
      }) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height -
        mediaQuery.padding.top -
        appBarHeight -
        (includeBottomNavBar ? bottomNavBarHeight : 0);
  }

  /// Gets the pixel ratio
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  /// Gets the status bar height
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Gets the bottom navigation bar height (now uses the constant)
  static double getBottomNavigationBarHeight() {
    return bottomNavBarHeight;
  }

  /// Gets the keyboard height
  static double getKeyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  /// Checks if keyboard is visible
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  /// Checks if device has internet connection
  static Future<bool> hasInternetConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  /// Vibrates the device
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// Sets preferred screen orientations
  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Shows or hides the system overlays (status bar and navigation bar)
  static Future<void> showSystemOverlays() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  static Future<void> hideSystemOverlays() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  /// Checks if device is a tablet
  static bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide > 600;
  }

  /// Checks if device is a phone
  static bool isPhone(BuildContext context) {
    return !isTablet(context);
  }
}