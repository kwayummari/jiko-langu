// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:jiko_langu/routes/routes.dart';
import 'package:jiko_langu/routes/route-names.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
     const MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>  MaterialApp(
    initialRoute: RouteNames.splash,
      routes: routes,
      builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
          ),
      debugShowCheckedModeBanner: false,
      title: 'Tabiri',
      theme: ThemeData(
          // timePickerTheme: Theme.of(context).primaryColor,
          cardColor: Colors.green.shade900,
          highlightColor: Colors.green.shade900,
          splashColor: Colors.green.shade900,
          primaryColor: Colors.green.shade700,
          visualDensity: VisualDensity.adaptivePlatformDensity,
           colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
            ).copyWith(background: Colors.green.shade900)),);
}
