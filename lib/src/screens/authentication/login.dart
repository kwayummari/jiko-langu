import 'package:flutter/material.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jiko_langu/routes/route-names.dart';
import 'package:jiko_langu/src/service/login.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_button.dart';
import 'package:jiko_langu/src/widgets/app_container.dart';
import 'package:jiko_langu/src/widgets/app_input_text.dart';
import 'package:jiko_langu/src/widgets/app_snackbar.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginService _apiService = loginService();
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  bool dont_show_password = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      bgcolor: AppConst.black,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/logo.png', height: 250,),
              AppText(
                txt: 'LOGIN',
                size: 30,
                color: AppConst.primary,
                weight: FontWeight.w900,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    AppInputText(
                      textfieldcontroller: id,
                      icon: Icon(
                        Icons.person,
                        color: AppConst.black,
                      ),
                      label: 'Id',
                      obscure: false,
                      isemail: true,
                      fillcolor: AppConst.secondary,
                    ),
                    AppInputText(
                      textfieldcontroller: password,
                      icon: Icon(
                        Icons.lock,
                        color: AppConst.black,
                      ),
                      label: 'Password',
                      obscure: dont_show_password,
                      suffixicon: IconButton(
                          onPressed: (() {
                            setState(() {
                              dont_show_password = !dont_show_password;
                            });
                          }),
                          icon: Icon(dont_show_password ? Icons.visibility_off : Icons.visibility)),
                      isemail: false,
                      fillcolor: AppConst.secondary,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: AppText(
                        txt: 'Forgot Password?',
                        size: 15,
                        color: AppConst.primary,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppContainer(
                      width: 420,
                      height: 50,
                      bottom: 0,
                      child: AppButton(
                        label: 'LOGIN',
                        onPress: () async {
                          Navigator.pushNamedAndRemoveUntil(
                                    context, RouteNames.bottomNavigationBar, (_) => false);
                          try {
                            final response = await _apiService.login(
                                context,
                                id.text.toString(),
                                password.text.toString());
                            AppSnackbar(
                              isError: response.toString() == 'success'
                                  ? false
                                  : true,
                              response: response.toString(),
                            ).show(context);
                            if (response.toString() == 'success') {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  'email', id.text.toString());
                              if (response.toString() == 'success')
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RouteNames.bottomNavigationBar, (_) => false);
                            }

                            // handle successful login response
                          } catch (e) {
                            // handle login error
                            AppSnackbar(
                              isError: true,
                              response: e.toString(),
                            ).show(context);
                          }
                        },
                        bcolor: AppConst.primary,
                        borderRadius: 20,
                        textColor: AppConst.secondary,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteNames.registration),
                child: Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: AppText(
                    size: 15,
                    txt: 'Not a member? Create Account',
                    color: AppConst.primary,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
