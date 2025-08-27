import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // Define user properties
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? username;
  String? phone;
  String? imagePath;

  // Constructor
  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.phone,
    this.imagePath,
  });

  static List<String> nameParts(fullname) => fullname.split(' ');
  // ✅ Format full name
  String get fullName {
    if ((firstName ?? '').isEmpty && (lastName ?? '').isEmpty) {
      return '';
    }
    return '${firstName ?? ''} ${lastName ?? ''}'.trim();
  }

  // ✅ Format phone number (basic example: remove spaces & +964 → 0 for Iraq)
  String get formattedPhone {
    if (phone == null) return '';
    String clean = phone!.replaceAll(RegExp(r'\D'), ''); // remove non-digits
    if (clean.startsWith('964')) {
      clean = '0${clean.substring(3)}'; // convert 964xxx → 0xxx
    }
    return clean;
  }

  // ✅ Generate username (from email OR full name)
  static String generatedUsername(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "user_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() {
    return UserModel(
      id: '',
      email: '',
      firstName: '',
      lastName: '',
      username: '',
      phone: '',
      imagePath: '',
    );
  }

  // ✅ Convert to JSON (using formatted values)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'username': username ?? generatedUsername(fullName),
      'phone': formattedPhone,
      'image_path': imagePath,
      'full_name': fullName, // optional, for convenience
    };
  }

  // ✅ From JSON factory
  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
      id: doc.id,
      email: doc['email'],
      firstName: doc['first_name'],
      lastName: doc['last_name'],
      username: doc['username'],
      phone: doc['phone'],
      imagePath: doc['image_path'],
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() != null) {
      final data = doc.data()!;
      return UserModel(
        id: doc.id,
        email: data['email'] ?? '',
        firstName: data['first_name'] ?? '',
        lastName: data['last_name'] ?? '',
        username: data['username'] ?? '',
        phone: data['phone'] ?? '',
        imagePath: data['image_path'] ?? '',
      );
    }
    return UserModel.empty();
  }
}
