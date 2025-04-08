import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AHelperFunctions {
  /// Get color from string value (case insensitive)
  static Color? getColor(String value) {
    // Define your product specific colors here
    switch (value.toLowerCase()) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'pink':
        return Colors.pink;
      case 'grey':
        return Colors.grey;
      case 'purple':
        return Colors.purple;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'orange':
        return Colors.orange;
      case 'yellow':
        return Colors.yellow;
      case 'teal':
        return Colors.teal;
      case 'cyan':
        return Colors.cyan;
      case 'brown':
        return Colors.brown;
      case 'amber':
        return Colors.amber;
      default:
        return null;
    }
  }

  /// Get color from hex string (e.g., #FF0000)
  static Color? getColorFromHex(String hexString) {
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) {
        buffer.write('ff');
        buffer.write(hexString.replaceFirst('#', ''));
        return Color(int.parse(buffer.toString(), radix: 16));
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  /// Show a snackbar message
  static void showSnackBar(String message, {bool isError = false}) {
    Get.snackbar(
      isError ? 'Error' : 'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white,
    );
  }

  /// Show an alert dialog
  static void showAlert(String title, String message, {String confirmText = 'OK'}) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        child: Text(confirmText),
      ),
    );
  }

  /// Format date with optional pattern
  static String formatDate(DateTime date, {String pattern = 'dd MMM yyyy'}) {
    return DateFormat(pattern).format(date);
  }

  /// Capitalize first letter of each word
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// Check if device is in dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Get screen size
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Get screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Get responsive padding/margin
  static double responsiveValue(BuildContext context,
      {double mobile = 8.0, double tablet = 16.0, double desktop = 24.0}) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return mobile;
    if (width < 1100) return tablet;
    return desktop;
  }

  /// Remove duplicate items from a list
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Wrap text with overflow handling
  static String wrapText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Get contrast color (black or white) based on background color
  static Color getContrastColor(Color backgroundColor) {
    // Calculate the perceptive luminance
    final luminance = (0.299 * backgroundColor.red +
        0.587 * backgroundColor.green +
        0.114 * backgroundColor.blue) / 255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  /// Check if screen width is less than specified value
  static bool isSmallScreen(BuildContext context, {double width = 600}) {
    return screenWidth(context) < width;
  }

  /// Check if screen height is less than specified value
  static bool isShortScreen(BuildContext context, {double height = 700}) {
    return screenHeight(context) < height;
  }
}