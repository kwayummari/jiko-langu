import 'package:flutter/material.dart';
import 'package:jiko_langu/routes/route-names.dart';
import 'package:jiko_langu/src/service/data.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_button.dart';
import 'package:jiko_langu/src/widgets/app_dropdown.dart';
import 'package:jiko_langu/src/widgets/app_input_text.dart';
import 'package:jiko_langu/src/widgets/app_snackbar.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';
import 'package:jiko_langu/src/widgets/app_toggle_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        bgcolor: AppConst.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppConst.primary,
          centerTitle: true,
          title: AppText(
            txt: 'Welcome back John Doe',
            size: 15,
            color: AppConst.secondary,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                color: AppConst.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(txt: 'Welcome to JIKOLANGU! Control your stove at your pace and prepare your food freely as you wish', size: 20, color: AppConst.secondary,),
              ),
            ),
            SizedBox(height: 30,),
            AppToggleButton(title: 'Bluetooth', value: value, onChanged: (newValue) {
              value = !value;
            })
          ],
        ));
  }
}
