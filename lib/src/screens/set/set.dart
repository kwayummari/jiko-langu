import 'package:flutter/material.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';

class setTimer extends StatefulWidget {
  const setTimer({Key? key}) : super(key: key);

  @override
  State<setTimer> createState() => _setTimerState();
}

class _setTimerState extends State<setTimer> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        bgcolor: AppConst.black,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: AppConst.primary,
                ),
                AppText(
                  txt: 'Set Timer',
                  size: 15,
                  color: AppConst.primary,
                ),
              ],
            ),
          ],
        ));
  }
}
