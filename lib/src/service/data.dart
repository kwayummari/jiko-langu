import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import '../connection/api.dart';

class dataService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future login(BuildContext context) async {
    Map<String, dynamic> data = {
      'age': '14',
      'sex': '1',
      'cp': '0',
      'trestbps': '145',
      'chol': '200',
      'fbs': '1',
      'restecg': '0',
      'thalach': '100',
      'exang': '1',
      'oldpeak': '2.4',
      'slope': '2',
      'ca': '0',
      'thal': '3',
      'target': '0'
    };

    final response = await api.post('model.php', data);
    return response;
  }
}
