import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/personalization/models/brandModel.dart';
import 'package:ecommerce/features/personalization/models/productAtturbiateModel.dart';
import 'package:ecommerce/features/personalization/models/product_variation_model.dart';

/// Brand model

/// Product attribute model

/// Product variation model

/// Main Product Model
class ProductModel {
  final String id;
  final int stock;
  final String sku;
  final double price;
  final String title;
  final double salePrice;
  final String thumbnail;
  final String? productType;
  final bool isFeatured;
  final BrandModel? brand;
  final String description;
  final String categoryId;
  final List<String> images;
  final List<ProductAttributeModel> attributes;
  final List<ProductVariationModel> variations;

  ProductModel({
    required this.id,
    this.stock = 0,
    this.sku = '',
    this.price = 0.0,
    this.title = '',
    this.salePrice = 0.0,
    this.thumbnail = '',
    this.isFeatured = false,
    this.brand,
    this.productType,
    this.description = '',
    this.categoryId = '',
    this.images = const [],
    this.attributes = const [],
    this.variations = const [],
  });

  static ProductModel empty() => ProductModel(id: '');

  factory ProductModel.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) return ProductModel.empty();

    double parseDouble(dynamic value, [double defaultValue = 0.0]) {
      if (value == null) return defaultValue;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? defaultValue;
      return defaultValue;
    }

    int parseInt(dynamic value, [int defaultValue = 0]) {
      if (value == null) return defaultValue;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? defaultValue;
      return defaultValue;
    }

    return ProductModel(
      id: doc.id,
      stock: parseInt(data['Stock'], 1),
      sku: data['SKU'] ?? '',
      price: parseDouble(data['Price']),
      title: data['title'] ?? '',
      salePrice: parseDouble(data['SalePrice']),
      thumbnail: data['Thumbnail '] ?? '', // ✅ fixed
      isFeatured: data['IsFeatured'] ?? false,
      productType: data['ProductType'],
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      description: data['Description'] ?? '',
      categoryId: data['categoryId'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      attributes: data['ProductAttributes'] != null
          ? (data['ProductAttributes'] as List)
                .map((e) => ProductAttributeModel.fromJson(e))
                .toList()
          : [],
      variations: data['ProductVariations'] != null
          ? (data['ProductVariations'] as List)
                .map((e) => ProductVariationModel.fromJson(e))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Stock': stock.toString(),
      'SKU': sku,
      'Price': price.toString(),
      'title': title,
      'SalePrice': salePrice.toString(),
      'Thumbnail': thumbnail,
      'ProductType': productType,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'Description': description,
      'categoryId': categoryId,
      'Images': images,
      'ProductAttributes': attributes.map((e) => e.toJson()).toList(),
      'ProductVariations': variations.map((e) => e.toJson()).toList(),
    };
  }
}
