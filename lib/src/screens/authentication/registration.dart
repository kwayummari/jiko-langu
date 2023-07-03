import 'package:flutter/material.dart';
import 'package:jiko_langu/routes/route-names.dart';
import 'package:jiko_langu/src/service/registration.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_button.dart';
import 'package:jiko_langu/src/widgets/app_input_text.dart';
import 'package:jiko_langu/src/widgets/app_snackbar.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final registrationService _apiService = registrationService();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
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
                height: 100,
              ),
              AppText(
                size: 30,
                txt: 'JIKO LANGU',
                weight: FontWeight.w900,
                color: AppConst.primary,
              ),
              SizedBox(
                height: 20,
              ),
              AppText(
                txt: 'SIGN UP',
                size: 20,
                color: AppConst.secondary,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  AppInputText(
                    textfieldcontroller: name,
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: 'Full Name',
                    obscure: false,
                    isemail: false,
                    fillcolor: AppConst.secondary,
                  ),
                  AppInputText(
                    textfieldcontroller: id,
                    icon: Icon(
                      Icons.card_travel,
                      color: Colors.black,
                    ),
                    label: 'Id',
                    obscure: false,
                    isemail: false,
                    fillcolor: AppConst.secondary,
                  ),
                  AppInputText(
                    textfieldcontroller: phone,
                    icon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    label: 'Phone',
                    obscure: false,
                    isemail: false,
                    fillcolor: AppConst.secondary,
                  ),
                  AppInputText(
                    textfieldcontroller: phone,
                    icon: Icon(
                      Icons.location_history,
                      color: Colors.black,
                    ),
                    obscure: false,
                    label: 'location',
                    isemail: false,
                    fillcolor: AppConst.secondary,
                  ),
                  AppInputText(
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
                    fillcolor: AppConst.secondary,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, RouteNames.login),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: AppText(
                        size: 15,
                        txt: 'Already have an account? Sign In',
                        color: AppConst.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 370,
                    child: AppButton(
                      label: 'SIGN UP',
                      onPress: () async {
                        try {
                          final response = await _apiService.registration(
                              context,
                              name.text,
                              id.text,
                              phone.text,
                              address.text);
                          AppSnackbar(
                            isError: false,
                            response: response.toString(),
                          ).show(context); // handle successful login response
                          Navigator.pushNamedAndRemoveUntil(
                              context, RouteNames.login, (_) => false);
                        } catch (e) {
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
            ],
          )),
    );
  }
}
