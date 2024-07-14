import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app.dart';

class PostService {
  static Future<dynamic> fetchPosts() async {
    final response = await http.get(
      Uri.parse('$API_URL/api/posts'),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(response.body);
  }

  static Future<dynamic> fetchPost(String id) async {
    final response = await http.get(
      Uri.parse('$API_URL/api/posts/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(response.body);
  }
}
