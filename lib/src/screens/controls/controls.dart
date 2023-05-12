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
            ),
            SizedBox(height: 200,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.primary,
                    child: AppText(txt: 'On',size: 30, color: AppConst.secondary, weight: FontWeight.w900,),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConst.primary,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.transparent,
                      child: AppText(
                        txt: '1',
                        size: 30,
                        color: AppConst.secondary,
                        weight: FontWeight.w900,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConst.primary,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.transparent,
                      child: AppText(
                        txt: '2',
                        size: 30,
                        color: AppConst.secondary,
                        weight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConst.primary,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.transparent,
                      child: AppText(
                        txt: '3',
                        size: 30,
                        color: AppConst.secondary,
                        weight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConst.primary,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.transparent,
                      child: AppText(
                        txt: '4',
                        size: 30,
                        color: AppConst.secondary,
                        weight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConst.primary,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.transparent,
                      child: AppText(
                        txt: '5',
                        size: 30,
                        color: AppConst.secondary,
                        weight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConst.primary,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.transparent,
                      child: AppText(
                        txt: '6',
                        size: 30,
                        color: AppConst.secondary,
                        weight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConst.primary,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.transparent,
                      child: AppText(
                        txt: '7',
                        size: 30,
                        color: AppConst.secondary,
                        weight: FontWeight.w900,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.grey,
                    child: AppText(txt: 'Off',size: 30, color: AppConst.secondary, weight: FontWeight.w900,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        )
    );
  }
}
