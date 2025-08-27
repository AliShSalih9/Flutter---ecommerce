class DPricingCalculator {
  // Calculate total price based on tax and shipping in Iraq
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  // Return formatted shipping cost as a string
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return "${shippingCost.toStringAsFixed(2)} IQD";
  }

  // Calculate only the tax for the given location
  static double calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount;
  }

  // Example: Iraqi tax rates (adjust as needed)
  static double getTaxRateForLocation(String location) {
    switch (location.toLowerCase()) {
      case 'baghdad':
        return 0.15; // 15% VAT
      case 'erbil':
      case 'duhok':
      case 'sulaymaniyah':
        return 0.10; // 10% tax for Kurdistan region
      default:
        return 0.08; // Default tax rate
    }
  }

  // Example: Shipping cost by location (in IQD)
  static double getShippingCost(String location) {
    switch (location.toLowerCase()) {
      case 'baghdad':
        return 5000;
      case 'erbil':
        return 7000;
      case 'duhok':
        return 6000;
      case 'sulaymaniyah':
        return 7500;
      case 'akre':
        return 6500;
      case 'kirkuk':
        return 7200;
      case 'mosul':
        return 6800;
      case 'zaxo':
        return 6000;
      case 'halabja':
        return 7000;
      case 'khanaqin':
        return 7500;
      default:
        return 8000; // Default for rural or unknown areas
    }
  }
}
