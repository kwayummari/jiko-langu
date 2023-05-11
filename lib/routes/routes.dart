import 'package:flutter/material.dart';
import 'package:jiko_langu/src/screens/authentication/login.dart';
import 'package:jiko_langu/src/screens/authentication/registration.dart';
import 'package:jiko_langu/src/screens/home/homepage.dart';
import 'package:jiko_langu/src/screens/results/results.dart';
import 'package:jiko_langu/src/screens/splash.dart';
import 'package:jiko_langu/routes/route-names.dart';


final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.home:(context) => Homepage(),
  RouteNames.results:(context) => results(),
};
