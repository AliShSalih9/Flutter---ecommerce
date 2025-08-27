import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageURL;
  final String targetSreen;
  final bool active;

  BannerModel({
    required this.imageURL,
    required this.targetSreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageURL': imageURL,
      'targetScreen': targetSreen,
      'active': active,
    };
  }

  factory BannerModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageURL: data['imageURL'],
      targetSreen: data['targetScreen'],
      active: data['active'],
    );
  }
}
