import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import '../connection/api.dart';

class loginService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future login(BuildContext context, String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    final response = await api.post('login.php', data);
    return response;
  }
}

class registrationService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future registration(BuildContext context, String email, String password,
      String fullname, String region) async {
    Map<String, dynamic> data = {
      'email': email.toString(),
      'fullname': fullname.toString(),
      'region': region.toString(),
      'password': password.toString(),
    };
    final response = await api.post('registration.php', data);
    return response;
  }
}
