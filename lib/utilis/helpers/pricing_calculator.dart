import 'package:intl/intl.dart';

class APricingCalculator {
  /// Calculate the total price including tax and shipping
  static double calculateTotalPrice(double productPrice, String location, {int quantity = 1}) {
    try {
      if (productPrice <= 0) throw ArgumentError('Product price must be positive');
      if (quantity < 1) throw ArgumentError('Quantity must be at least 1');

      double taxRate = getTaxRateForLocation(location);
      double taxAmount = productPrice * taxRate * quantity;

      double shippingCost = getShippingCost(location, productPrice, quantity);

      double totalPrice = (productPrice * quantity) + taxAmount + shippingCost;
      return double.parse(totalPrice.toStringAsFixed(2)); // Round to 2 decimal places
    } catch (e) {
      throw Exception('Failed to calculate total price: $e');
    }
  }

  /// Calculate shipping cost with formatted string output
  static String calculateShippingCost(double productPrice, String location, {int quantity = 1}) {
    try {
      double shippingCost = getShippingCost(location, productPrice, quantity);
      return shippingCost.toStringAsFixed(2);
    } catch (e) {
      return '0.00'; // Fallback value
    }
  }

  /// Calculate tax with formatted string output
  static String calculateTax(double productPrice, String location, {int quantity = 1}) {
    try {
      double taxRate = getTaxRateForLocation(location);
      double taxAmount = productPrice * taxRate * quantity;
      return taxAmount.toStringAsFixed(2);
    } catch (e) {
      return '0.00'; // Fallback value
    }
  }

  /// Get tax rate for a specific location
  static double getTaxRateForLocation(String location) {
    final taxRates = {
      'US': 0.08, 'UK': 0.20, 'CA': 0.13, 'DE': 0.19,
      'AU': 0.10, 'JP': 0.10, 'FR': 0.20, 'IN': 0.18,
      'IT': 0.22, 'ES': 0.21, 'NL': 0.21, 'SG': 0.07,
    };
    return taxRates[location.toUpperCase()] ?? 0.0;
  }

  /// Get shipping cost based on location, price, and quantity
  static double getShippingCost(String location, double productPrice, int quantity) {
    final baseShippingRates = {
      'US': 5.00, 'UK': 8.00, 'CA': 7.00, 'DE': 6.00,
      'AU': 10.00, 'JP': 9.00, 'FR': 7.50, 'IN': 4.00,
      'IT': 8.50, 'ES': 7.00, 'NL': 6.50, 'SG': 5.50,
    };

    // Free shipping for orders over $100 or more than 5 items
    if (productPrice * quantity >= 100 || quantity >= 5) return 0.0;

    double perItemCharge = (quantity - 1) * 1.50;
    return (baseShippingRates[location.toUpperCase()] ?? 12.00) + perItemCharge;
  }

  /// Calculate discounted price with validation
  static double calculateDiscountedPrice(double originalPrice, double discountPercentage) {
    if (originalPrice <= 0) throw ArgumentError('Price must be positive');
    if (discountPercentage < 0 || discountPercentage > 100) {
      throw ArgumentError('Discount must be between 0-100');
    }
    return (originalPrice * (100 - discountPercentage) / 100);
  }

  /// Format price with currency symbol and locale
  static String formatPrice(double price, {String currency = 'USD'}) {
    try {
      return NumberFormat.currency(
        locale: _getLocaleForCurrency(currency),
        symbol: _getCurrencySymbol(currency),
        decimalDigits: 2,
      ).format(price);
    } catch (e) {
      return '\$${price.toStringAsFixed(2)}'; // Fallback format
    }
  }

  static String _getLocaleForCurrency(String currency) {
    final locales = {
      'USD': 'en_US', 'EUR': 'de_DE', 'GBP': 'en_GB',
      'JPY': 'ja_JP', 'CAD': 'en_CA', 'AUD': 'en_AU',
      'INR': 'en_IN', 'SGD': 'en_SG', 'CNY': 'zh_CN',
    };
    return locales[currency.toUpperCase()] ?? 'en_US';
  }

  static String _getCurrencySymbol(String currency) {
    final symbols = {
      'USD': '\$', 'EUR': '€', 'GBP': '£', 'JPY': '¥',
      'CAD': '\$', 'AUD': '\$', 'INR': '₹', 'SGD': '\$',
      'CNY': '¥', 'KRW': '₩', 'RUB': '₽', 'BRL': 'R\$',
    };
    return symbols[currency.toUpperCase()] ?? '\$';
  }

  /// Calculate price per month for subscriptions
  static String calculateMonthlyPrice(double annualPrice, {String currency = 'USD'}) {
    final monthly = annualPrice / 12;
    return formatPrice(monthly, currency: currency);
  }
}