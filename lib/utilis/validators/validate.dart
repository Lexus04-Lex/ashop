class TValidator {
  /// Validates an email address
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  /// Validates a password with multiple requirements
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  /// Validates a phone number (US format by default)
  static String? validatePhoneNumber(String? value, {String countryCode = 'US'}) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Remove all non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    // Country-specific validation
    switch (countryCode.toUpperCase()) {
      case 'US':
        if (digitsOnly.length != 10) {
          return 'Invalid phone number format (10 digits required).';
        }
        break;
      case 'UK':
        if (digitsOnly.length != 11) {
          return 'Invalid phone number format (11 digits required).';
        }
        break;
      case 'IN':
        if (digitsOnly.length != 10) {
          return 'Invalid phone number format (10 digits required).';
        }
        break;
      default:
        if (digitsOnly.length < 8 || digitsOnly.length > 15) {
          return 'Invalid phone number format (8-15 digits required).';
        }
    }

    return null;
  }

  /// Validates a non-empty text field
  static String? validateRequiredField(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'This field'} is required.';
    }
    return null;
  }

  /// Validates a confirmation field (e.g., password confirmation)
  static String? validateConfirmation(String? value, String? originalValue, {String? fieldName}) {
    if (value != originalValue) {
      return '${fieldName ?? 'Confirmation'} does not match.';
    }
    return null;
  }

  /// Validates a numeric value
  static String? validateNumeric(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required.';
    }

    if (double.tryParse(value) == null) {
      return '${fieldName ?? 'This field'} must be a number.';
    }

    return null;
  }
}