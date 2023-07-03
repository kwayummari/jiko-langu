import 'package:flutter/material.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_input_text.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';

class setTimer extends StatefulWidget {
  const setTimer({Key? key}) : super(key: key);

  @override
  State<setTimer> createState() => _setTimerState();
}

class _setTimerState extends State<setTimer> {
  TextEditingController meal = TextEditingController();
  TextEditingController time = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: AppConst.primary,
            ),
            SizedBox(
              width: 20,
            ),
            AppText(
              txt: 'Set Timer',
              size: 15,
              color: AppConst.primary,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        AppInputText(
            textfieldcontroller: meal,
            isemail: false,
            fillcolor: AppConst.transparent,
            label: 'Enter Meal',
            obscure: false),
            AppInputText(
            textfieldcontroller: time,
            isemail: false,
            fillcolor: AppConst.transparent,
            label: 'Enter time (in min)',
            obscure: false)
      ],
    ));
  }
}
