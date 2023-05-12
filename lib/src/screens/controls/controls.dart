import 'package:flutter/material.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';

class control extends StatefulWidget {
  const control({Key? key}) : super(key: key);

  @override
  State<control> createState() => _controlState();
}

class _controlState extends State<control> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      bgcolor: AppConst.black,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.arrow_back, color: AppConst.primary,),
                AppText(txt: 'JIKO LANGU', size: 15, color: AppConst.primary,),
                Spacer(),
                AppText(txt: 'ID 2300998', size: 15, color: AppConst.primary,)
              ],
            )
          ],
        )
    );
  }
}
