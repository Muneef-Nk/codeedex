import 'dart:convert';
import 'package:codeedex/core/api/api/api.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static signin({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.BASE_URL}${ApiConfig.LOGIN}');

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      var decodedResponse = jsonDecode(response.body);

      if (decodedResponse is List) {
        return {
          "success": false,
          "message": decodedResponse.join("\n"),
        };
      } else if (decodedResponse is Map<String, dynamic>) {
        if (response.statusCode == 200) {
          return decodedResponse;
        } else if (response.statusCode == 403) {
          return {
            "success": false,
            "message": decodedResponse['detail'] ?? "User not found!",
          };
        }
      } else {
        return {
          "success": false,
          "message": "Something went wrong.",
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Error: $e",
      };
    }
  }
}
