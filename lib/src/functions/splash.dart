// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:jiko_langu/routes/route-names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFunction {
  var id;

  Future navigatorToHome(context) async {
    await getValidationData();

    await Future.delayed(Duration(seconds: 1), () {});

      if (id == null) {
        Navigator.pushNamed(context, RouteNames.login);
      } {
        Navigator.pushNamed(context, RouteNames.bottomNavigationBar);
      } 
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var i = sharedPreferences.getString('id');
    id = i;
  }

  Future<String> getId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var i = sharedPreferences.getString('id');
    return i.toString();
  }
}