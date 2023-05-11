import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabiri/routes/route-names.dart';
import 'package:tabiri/src/service/login.dart';
import 'package:tabiri/src/widgets/app_base_screen.dart';
import 'package:tabiri/src/widgets/app_button.dart';
import 'package:tabiri/src/widgets/app_card.dart';
import 'package:tabiri/src/widgets/app_container.dart';
import 'package:tabiri/src/widgets/app_input_text.dart';
import 'package:tabiri/src/widgets/app_snackbar.dart';
import 'package:tabiri/src/widgets/app_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginService _apiService = loginService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool dont_show_password = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              AppText(
                size: 20,
                txt: 'TABIRI',
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/logo.png'),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250),
                child: AppText(
                  txt: 'LOGIN',
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppCard(
                    color: Colors.grey.shade200,
                    border: 20,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        AppContainer(
                            width: 340,
                            bottom: 24,
                            child: AppInputText(
                              textfieldcontroller: email,
                              icon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              label: 'Email',
                              obscure: false,
                              isemail: true,
                              fillcolor: HexColor('e7d4d3'),
                            )),
                        AppContainer(
                            width: 340,
                            bottom: 0,
                            child: AppInputText(
                              textfieldcontroller: password,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              label: 'Password',
                              obscure: dont_show_password,
                              suffixicon: IconButton(
                                  onPressed: (() {
                                    setState(() {
                                      dont_show_password = !dont_show_password;
                                    });
                                  }),
                                  icon: Icon(Icons.remove_red_eye)),
                              isemail: false,
                              fillcolor: HexColor('e7d4d3'),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: AppText(
                            txt: 'Forgot Password?',
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppContainer(
                          width: 140,
                          bottom: 0,
                          child: AppButton(
                            label: 'LOGIN',
                            onPress: () async {
                              Navigator.pushNamedAndRemoveUntil(
                                        context, RouteNames.home, (_) => false);
                              try {
                                final response = await _apiService.login(
                                    context,
                                    email.text.toString(),
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
                                      'email', email.text.toString());
                                  if (response.toString() == 'success')
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, RouteNames.home, (_) => false);
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
                            bcolor: HexColor('#e7d4d3'),
                            borderRadius: 20,
                            textColor: Colors.black,
                          ),
                        )
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteNames.registration),
                child: Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: AppText(
                    size: 15,
                    txt: 'Not a member? Create Account',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
