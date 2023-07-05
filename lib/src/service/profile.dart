import 'package:flutter/material.dart';
import 'package:jiko_langu/src/connection/api.dart';

class profileService {
  Api api = Api();
  Future profile(BuildContext context, String id) async {
    Map<String, dynamic> data = {
      'id': id.toString(),
    };
    final response = await api.post('profile/get.php', data);
    List datas = response;
    return datas;
  }
}