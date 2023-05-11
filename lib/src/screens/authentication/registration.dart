import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tabiri/routes/route-names.dart';
import 'package:tabiri/src/service/registration.dart';
import 'package:tabiri/src/widgets/app_base_screen.dart';
import 'package:tabiri/src/widgets/app_button.dart';
import 'package:tabiri/src/widgets/app_card.dart';
import 'package:tabiri/src/widgets/app_container.dart';
import 'package:tabiri/src/widgets/app_input_text.dart';
import 'package:tabiri/src/widgets/app_snackbar.dart';
import 'package:tabiri/src/widgets/app_text.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final registrationService _apiService = registrationService();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rpassword = TextEditingController();
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
                height: 20,
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
                  txt: 'SIGN UP',
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
                              textfieldcontroller: fullName,
                              icon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              label: 'Full Name',
                              obscure: false,
                              isemail: false,
                              fillcolor: HexColor('e7d4d3'),
                            )),
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
                            bottom: 24,
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
                        AppContainer(
                            width: 340,
                            bottom: 24,
                            child: AppInputText(
                              onChange: (p0) {
                                if (p0 != password.text) {
                                  return "Passwords do not match";
                                } else {
                                  return null;
                                }
                              },
                              textfieldcontroller: rpassword,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              label: 'Re-enter Password',
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
                        AppContainer(
                            width: 340,
                            bottom: 0,
                            child: AppInputText(
                              textfieldcontroller: region,
                              icon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              label: 'Region of Residence',
                              obscure: false,
                              isemail: false,
                              fillcolor: HexColor('e7d4d3'),
                            )),
                        AppContainer(
                          width: 140,
                          bottom: 24,
                          child: AppButton(
                            label: 'SIGN UP',
                            onPress: () async {
                              try {
                                final response = await _apiService.registration(
                                    context,
                                    email.text,
                                    password.text,
                                    fullName.text,
                                    region.text);
                                AppSnackbar(
                                  isError: false,
                                  response: response.toString(),
                                ).show(
                                    context); // handle successful login response
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RouteNames.login, (_) => false);
                              } catch (e) {
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
                onTap: () => Navigator.pushNamed(context, RouteNames.login),
                child: Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: AppText(
                    size: 15,
                    txt: 'Already have an account? Login',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
