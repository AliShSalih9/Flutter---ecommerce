import 'dart:convert';

import 'package:http/http.dart' as http;

class DHttpHelper {
  static const String _baseUrl = 'https://api.example.com';

  // helper function to get the base url
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return handleResponse(response);
  }

  // helper function to post data
  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return handleResponse(response);
  }

  // helper function to put data
  static Future<Map<String, dynamic>> put(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return handleResponse(response);
  }

  // helper function to delete data
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return handleResponse(response);
  }

  // Handler ther Http Response
  static Map<String, dynamic> handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'error': response.statusCode, 'message': 'Failed to load data'};
    }
  }
}
