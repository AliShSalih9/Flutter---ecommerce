class ProductVariationModel {
  final String id;
  final String sku;
  final double price;
  final double salePrice;
  final int stock;
  final String image;
  final String description;
  final Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    required this.sku,
    required this.price,
    required this.salePrice,
    required this.stock,
    required this.image,
    required this.description,
    required this.attributeValues,
  });

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    int parseInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return ProductVariationModel(
      id: json['Id'] ?? '',
      sku: json['SKU'] ?? '',
      price: parseDouble(json['Price']),
      salePrice: parseDouble(json['SalePrice']),
      stock: parseInt(json['Stock']),
      image: json['Image'] ?? '',
      description: json['Description'] ?? '',
      attributeValues: json['AttributeValues'] != null
          ? Map<String, String>.from(json['AttributeValues'])
          : {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'Image': image,
      'Description': description,
      'AttributeValues': attributeValues,
    };
  }
}