import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:parim_app/ui/common/url_container.dart';

class ApiClient {
  final String baseUrl = UrlContainer.baseUrl;
  static String authToken = "garbage"; // Bearer token
  static ApiClient? _instance;

  Future get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $authToken'}, // Adding Bearer token
    );
    return response;
  }

  Future post(String endpoint, Map<String, dynamic> data) async{
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $authToken'}, // Adding Bearer token
      body: data,
    );

    return response;
  }

  initToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? "";
    String password = prefs.getString('password') ?? "";

    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $authToken'}, // Adding Bearer token
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      authToken = jsonDecode(response.body)['message']['token'];

      // Save token to shared preferences
      await prefs.setString('token', authToken);
    } else {
      throw Exception('Failed to load token');
    }
  }

  void printToken() {
    print(authToken);
  }

  // Singleton
  static getInstance() {
    _instance ??= ApiClient();
    return _instance;
  }

// ... Other methods for different types of requests

// Rest of the class implementation remains the same
}