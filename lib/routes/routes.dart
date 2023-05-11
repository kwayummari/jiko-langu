import 'package:flutter/material.dart';
import 'package:tabiri/src/screens/authentication/login.dart';
import 'package:tabiri/src/screens/authentication/registration.dart';
import 'package:tabiri/src/screens/home/homepage.dart';
import 'package:tabiri/src/screens/results/results.dart';
import 'package:tabiri/src/screens/splash.dart';
import 'package:tabiri/routes/route-names.dart';


final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.home:(context) => Homepage(),
  RouteNames.results:(context) => results(),
};
