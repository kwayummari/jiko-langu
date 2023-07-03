// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, curly_braces_in_flow_control_structures, depend_on_referenced_packages, library_private_types_in_public_api, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:jiko_langu/src/screens/controls/controls.dart';
import 'package:jiko_langu/src/screens/help/help.dart';
import 'package:jiko_langu/src/screens/home/homepage.dart';
import 'package:jiko_langu/src/screens/set/set.dart';
import 'package:jiko_langu/src/utils/app_const.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  _bottomNavigationState createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int index = 0;
  final Screen = [
    Homepage(),
    Control(),
    setTimer(),
    help()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            body: Screen[index],
            extendBody: true,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppConst.black,
                primaryColor: AppConst.black,
              ),
              child: BottomNavigationBar(
                selectedItemColor: AppConst.primary,
                unselectedItemColor: AppConst.grey,
                backgroundColor: AppConst.black,
                items: [
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                        backgroundColor: AppConst.primary,
                          child: Icon(Icons.home, color: AppConst.secondary,)), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(backgroundColor: AppConst.primary,child: Icon(Icons.fireplace, color: AppConst.secondary,)), label: 'Controls'),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(backgroundColor: AppConst.primary,child: Icon(Icons.timer, color: AppConst.secondary,)), label: 'Timer'),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(backgroundColor: AppConst.primary,child: Icon(Icons.help, color: AppConst.secondary,)), label: 'Help'),
                ],
                currentIndex: index,
                onTap: (index) {
                  if (mounted) setState(() => this.index = index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
