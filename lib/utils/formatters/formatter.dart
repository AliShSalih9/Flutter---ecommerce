import 'package:intl/intl.dart';

class DFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(
      locale: 'en_IQ', // or 'ar_IQ' for Arabic numerals
      symbol: 'IQD', // or use 'د.ع' for Arabic symbol
      decimalDigits: 0, // Iraqi Dinar usually has no decimals
    ).format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    String cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Ensure it's 11 digits and starts with 07
    if (cleaned.length == 11 && cleaned.startsWith('07')) {
      // Format as 4-3-4: 0770 123 4567
      return '${cleaned.substring(0, 4)} ${cleaned.substring(4, 7)} ${cleaned.substring(7)}';
    }

    // Invalid format, return original
    return phoneNumber;
  }

  // Not fully tasted.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters
    String cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // If number starts with 0 and is 11 digits (e.g., 07701234567)
    if (cleaned.length == 11 && cleaned.startsWith('0')) {
      return '+964${cleaned.substring(1)}'; // Remove '0', add '+964'
    }

    // Already in international format (e.g., +9647701234567 or 9647701234567)
    if (cleaned.startsWith('964') && cleaned.length == 12) {
      return '+$cleaned';
    }

    // Return original if it doesn't match expected formats
    return phoneNumber;
  }
}

