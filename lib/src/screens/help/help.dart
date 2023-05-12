import 'package:flutter/material.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';

class help extends StatefulWidget {
  const help({Key? key}) : super(key: key);

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        bgcolor: AppConst.black,
        child:  Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.arrow_back, color: AppConst.primary,),
                AppText(txt: 'Help', size: 15, color: AppConst.primary,),
                Spacer(),
                AppText(txt: 'ID 2300998', size: 15, color: AppConst.primary,)
              ],
            ),
          ],
        )
    );;
  }
}
