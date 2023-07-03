// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jiko_langu/routes/route-names.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatortohome();
  }

  var id;
  _navigatortohome() async {
    await getValidationData().whenComplete(() async {
      await Future.delayed(Duration(seconds: 1), () {});
      if (id == null) {
        Navigator.pushNamed(context, RouteNames.login);
      } else if (id != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.bottomNavigationBar, (_) => false);
      }
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var ids = sharedPreferences.get('id');
    setState(() {
      id = ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      bgcolor: AppConst.primary,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          Center(
              child: SpinKitHourGlass(
            duration: const Duration(seconds: 3),
            size: 100,
            color: HexColor('#000000'),
          )),
        ],
      ),
    );
  }
}
