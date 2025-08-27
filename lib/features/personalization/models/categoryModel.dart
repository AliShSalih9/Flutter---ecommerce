import 'package:cloud_firestore/cloud_firestore.dart';

class Categorymodel {
  String id;
  String name;
  String image;
  bool isFutared;
  String parentId;

  Categorymodel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFutared,
    this.parentId = '',
  });

  // Empty constructor for fallback
  static Categorymodel empty() =>
      Categorymodel(id: '', name: '', image: '', isFutared: false);

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFutared': isFutared,
      'parentId': parentId,
    };
  }

  // Create from Firestore document safely
  factory Categorymodel.fromJson(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data != null) {
      return Categorymodel(
        id: document.id,
        name: data['Name'] ?? '', // fallback if null
        image: data['image'] ?? '', // fallback if null
        isFutared: data['IsFeatured'] ?? false, // fallback if null
        parentId: data['parentId'] ?? '', // fallback if null
      );
    } else {
      return Categorymodel.empty();
    }
  }
}
