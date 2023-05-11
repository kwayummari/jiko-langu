import 'package:flutter/material.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';
class AppToggleButton extends StatelessWidget {
  final String title;
  final bool value;
  final ValueSetter<bool> onChanged;
  AppToggleButton({
    required this.title,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        height: 70,
        decoration: BoxDecoration(
            color: AppConst.secondary,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            border: Border.all(color: AppConst.primary)
        ),
        child: Row(
          children: <Widget>[
            Spacer(),
            AppText(txt: title, size: 30, color: AppConst.black, weight: FontWeight.w900,),
            SizedBox(width: 16.0),
            Transform.scale(
              scale: 1.5,
              child: Switch(
                value: value,
                onChanged: onChanged,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

