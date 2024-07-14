import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app.dart';

class PageService {
  static Future<dynamic> fetchPages() async {
    final response = await http.get(Uri.parse('$API_URL/api/pages'), headers: {
      'Content-Type': 'application/json',
    });
    return jsonDecode(response.body);
  }

  static Future<dynamic> fetchPage(String id) async {
    final response = await http.get(
      Uri.parse('$API_URL/api/pages/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(response.body);
  }
}
