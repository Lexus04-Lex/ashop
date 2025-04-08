import 'dart:math';

import 'package:intl/intl.dart';

class AFormatter {
  /// Formats date with optional custom format (default: 'dd-MMM-yyyy')
  static String formatDate(DateTime? date, {String format = 'dd-MMM-yyyy'}) {
    date ??= DateTime.now();
    return DateFormat(format).format(date);
  }

  /// Formats currency with optional locale and symbol (default: en_US, $)
  static String formatCurrency(double amount, {String locale = 'en_US', String symbol = '\$'}) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(amount);
  }

  /// International phone number formatting
  static String formatPhoneNumber(String phoneNumber, {String countryCode = 'US'}) {
    try {
      // Remove all non-digit characters
      String digits = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

      // Handle different country formats
      switch (countryCode.toUpperCase()) {
        case 'US':
          if (digits.length == 10) {
            return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
          } else if (digits.length == 11) {
            return '+${digits.substring(0, 1)} (${digits.substring(1, 4)}) ${digits.substring(4, 7)}-${digits.substring(7)}';
          }
          break;
        case 'UK':
          if (digits.length == 11) {
            return '+44 ${digits.substring(1, 5)} ${digits.substring(5)}';
          }
          break;
        case 'IN':
          if (digits.length == 10) {
            return '+91 ${digits.substring(0, 5)} ${digits.substring(5)}';
          }
          break;
      }

      // Fallback for other formats
      if (digits.length > 3) {
        return '+$digits';
      }
    } catch (e) {
      // Return original if formatting fails
    }
    return phoneNumber;
  }

  /// Formats large numbers (e.g., 1000 → 1K)
  static String compactNumber(double number) {
    return NumberFormat.compact().format(number);
  }

  /// Formats percentage (0.25 → 25%)
  static String formatPercentage(double decimal, {int decimalDigits = 0}) {
    return NumberFormat.percentPattern().format(decimal);
  }

  /// Formats duration in HH:MM:SS format
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  /// Formats file size in human-readable format (e.g., 1.5 MB)
  static String formatFileSize(int bytes, {int decimals = 1}) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  /// Formats social media numbers (e.g., 1000 → 1K)
  static String socialMediaNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  /// Capitalizes the first letter of each word in a string
  static String capitalizeWords(String input) {
    return input.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  // static String formatPhoneNumber(String phoneNumber, {String? countryCode}) {
  //   try {
  //     // Remove all non-digit characters except leading +
  //     var digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
  //
  //     // Handle country code extraction if not provided
  //     String extractedCountryCode = '';
  //     if (countryCode == null && digitsOnly.startsWith('+')) {
  //       final plusIndex = digitsOnly.indexOf('+');
  //       extractedCountryCode = digitsOnly.substring(plusIndex, plusIndex + 3); // Assume 2-digit country code
  //       digitsOnly = digitsOnly.substring(plusIndex + 3);
  //     } else if (countryCode != null) {
  //       extractedCountryCode = countryCode.startsWith('+') ? countryCode : '+$countryCode';
  //     }
  //
  //     // Format the remaining digits
  //     final formattedNumber = StringBuffer();
  //     if (extractedCountryCode.isNotEmpty) {
  //       formattedNumber.write('($extractedCountryCode) ');
  //     }
  //
  //     int i = 0;
  //     while (i < digitsOnly.length) {
  //       int groupLength = 2;
  //
  //       // Special handling for US numbers
  //       if (i == 0 && extractedCountryCode == '+1') {
  //         groupLength = 3;
  //       }
  //       // Special handling for UK numbers
  //       else if (extractedCountryCode == '+44' && i == 0) {
  //         groupLength = 4;
  //       }
  //
  //       int end = i + groupLength;
  //       if (end > digitsOnly.length) {
  //         end = digitsOnly.length;
  //       }
  //
  //       formattedNumber.write(digitsOnly.substring(i, end));
  //
  //       if (end < digitsOnly.length) {
  //         formattedNumber.write(' ');
  //       }
  //
  //       i = end;
  //     }
  //
  //     return formattedNumber.toString().trim();
  //   } catch (e) {
  //     // Return original if formatting fails
  //     return phoneNumber;
  //   }
  // }
}