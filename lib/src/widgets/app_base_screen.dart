import 'package:flutter/material.dart';
import 'package:jiko_langu/src/utils/app_const.dart';

class AppBaseScreen extends StatelessWidget {
  final Widget child;
  final Widget? floatingAction;
  final bool? isLoading;
  final AppBar? appBar;
  final Color? bgcolor;
  final EdgeInsetsGeometry? padding;

  const AppBaseScreen(
      {Key? key,
      required this.child,
      this.isLoading = false,
      this.bgcolor,
      this.appBar,
      this.padding,
      this.floatingAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor ?? AppConst.secondary,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Padding(
              padding: padding ?? const EdgeInsets.all(16.0),
              child: child,
            ),
            if (isLoading == true) const CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButton: floatingAction,
    );
  }
}
