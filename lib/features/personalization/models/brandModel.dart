class BrandModel {
  final String id;
  final String image;
  final String name;

  BrandModel({required this.id, required this.image, required this.name});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['Id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'Id': id, 'image': image, 'name': name};
  }
}
