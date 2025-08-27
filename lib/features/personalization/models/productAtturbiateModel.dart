class ProductAttributeModel {
  final String name;
  final List<String> values;

  ProductAttributeModel({required this.name, required this.values});

  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    return ProductAttributeModel(
      name: json['Name'] ?? '',
      values: json['Values'] != null ? List<String>.from(json['Values']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'Name': name, 'Values': values};
  }
}