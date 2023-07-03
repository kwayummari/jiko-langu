import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import '../connection/api.dart';

class registrationService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future registration(BuildContext context, String email, String password,
      String phone, String fullname, String id) async {
    Map<String, dynamic> data = {
      'address': email.toString(),
      'name': fullname.toString(),
      'user_id': id.toString(),
      'password': password.toString(),
      'phone': phone.toString()
    };
    print(data);
    final response = await api.post('auth/registration.php', data);
    return response;
  }
}
