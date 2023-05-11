import 'package:flutter/material.dart';
import 'package:jiko_langu/routes/route-names.dart';
import 'package:jiko_langu/src/service/data.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_button.dart';
import 'package:jiko_langu/src/widgets/app_dropdown.dart';
import 'package:jiko_langu/src/widgets/app_input_text.dart';
import 'package:jiko_langu/src/widgets/app_snackbar.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final dataService _dataService = dataService();
  TextEditingController age = TextEditingController();
  TextEditingController restingBloodPressure = TextEditingController();
  TextEditingController cholesterol = TextEditingController();
  TextEditingController thalach = TextEditingController();
  TextEditingController exang = TextEditingController();
  TextEditingController oldPeak = TextEditingController();
  TextEditingController majorVessel = TextEditingController();
  var sex;
  var chestPain;
  var fastingBloodSugar;
  var Electrocardiographic;
  var slope;
  var thalassemia;
  var heartDisease;

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        bgcolor: AppConst.secondary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppConst.primary,
          centerTitle: true,
          title: AppText(
            txt: 'Heart prediction',
            size: 15,
            color: AppConst.secondary,
          ),
        ),
        child: Column(
          children: [
            AppText(
              txt:
                  'Please note that any data entered during prediction may not be saved or used for any purposes. Additionally, the prediction made by this model is not guaranteed to be 100% accurate and should not be relied upon as a substitute for medical advice. If you are experiencing any symptoms or concerns, please consult a qualified medical professional. This model is intended to be used as a tool for informational purposes only, and is not a substitute for a professional medical diagnosis.',
              size: 15,
              color: AppConst.primary,
              weight: FontWeight.w900,
            ),
            SizedBox(
              height: 20,
            ),
            AppInputText(
                textinputtype: TextInputType.number,
                labelColor: AppConst.secondary,
                textfieldcontroller: age,
                isemail: false,
                fillcolor: AppConst.secondary,
                label: 'Age',
                obscure: false),
            AppDropdownTextFormField(
              labelText: 'Sex',
              onChanged: (newValue) {
                setState(() {
                  sex = newValue;
                });
              },
              options: ['Select sex','Male', 'Female'],
              value: sex ?? 'Select sex',
            ),
            AppDropdownTextFormField(
              labelText: 'Chest pain type',
              options: [
                'Chest pain',
                'Asymptomatic',
                'Atypical Angina',
                'Non-aginal Pain',
                'Typical Agina'
              ],
              value: chestPain ?? 'Chest pain',
              onChanged: (newValue) {
                setState(() {
                  chestPain = newValue;
                });
              },
            ),
            AppInputText(
                textfieldcontroller: restingBloodPressure,
                isemail: false,
                textinputtype: TextInputType.number,
                labelColor: AppConst.secondary,
                fillcolor: AppConst.secondary,
                label: 'Resting Blood Pressure(mmHg)',
                obscure: false),
            AppInputText(
                textfieldcontroller: cholesterol,
                isemail: false,
                textinputtype: TextInputType.number,
                labelColor: AppConst.secondary,
                fillcolor: AppConst.secondary,
                label: 'Cholesterol Measurement(mg/dl)',
                obscure: false),
            AppDropdownTextFormField(
              labelText: 'Fasting Blood Sugar',
              options: [
                'Fasting Blood Sugar',
                'Greater than 120mg/dl',
                'Lower than 120mg/dl',
              ],
              value: fastingBloodSugar ?? 'Fasting Blood Sugar',
              onChanged: (newValue) {
                setState(() {
                  fastingBloodSugar = newValue;
                });
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Resting Electrocardiographic',
              options: [
                'Resting Electrocardiographic',
                'Showing probable or definite left ventricular hypertrophy by Estes\' criteria',
                'Normal',
                'Having ST-T wave abnormality(T wave inversion and/or ST elevation or depression of>0.05mV)',
              ],
              value: Electrocardiographic ?? 'Resting Electrocardiographic',
              onChanged: (newValue) {
                setState(() {
                  Electrocardiographic = newValue;
                });
              },
            ),
            AppInputText(
              textfieldcontroller: thalach,
              isemail: false,
              fillcolor: AppConst.secondary,
              label: 'The person\'s maximum heart rate achieved',
              obscure: false,
              labelColor: AppConst.secondary,
            ),
            AppInputText(
              textfieldcontroller: exang,
              isemail: false,
              fillcolor: AppConst.secondary,
              label: 'Exercise induced angina',
              obscure: false,
              labelColor: AppConst.secondary,
            ),
            AppInputText(
              textfieldcontroller: oldPeak,
              isemail: false,
              fillcolor: AppConst.secondary,
              label: 'St depression induced by exercise relative to rest',
              obscure: false,
              labelColor: AppConst.secondary,
            ),
            AppDropdownTextFormField(
              labelText: 'Slope of peak exercise ST segment',
              options: [
                'Slope of peak exercise',
                'Downsloping',
                'Flat',
                'Upsloping',
              ],
              value: slope ?? 'Slope of peak exercise',
              onChanged: (newValue) {
                setState(() {
                  slope = newValue;
                });
              },
            ),
            AppInputText(
                textfieldcontroller: majorVessel,
                isemail: false,
                labelColor: AppConst.secondary,
                fillcolor: AppConst.secondary,
                label: 'The number of major blood vessels',
                obscure: false),
            AppDropdownTextFormField(
              labelText: 'A blood disorder called thalassemia',
              options: [
                'Thalassemia',
                'Null(dropped from dataset previously)',
                'Fixed(No blood flow in some part of heart)',
                'Normal blood flow',
                'Reversible defect(a blood flow is observed but it is not normal)'
              ],
              value: thalassemia ?? 'Thalassemia',
              onChanged: (newValue) {
                setState(() {
                  thalassemia = newValue;
                });
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Heart disease',
              options: [
                'Heart disease',
                'Yes',
                'No',
              ],
              value: heartDisease ?? 'Heart disease',
              onChanged: (newValue) {
                setState(() {
                  heartDisease = newValue;
                });
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: AppButton(
                  onPress: () async {
                    Navigator.pushNamed(context, RouteNames.results);
                    try {
                      final response = await _dataService.login(context);
                      AppSnackbar(
                        isError:
                            response.toString() == 'success' ? false : true,
                        response: response.toString(),
                      ).show(context);
                    } catch (e) {
                      // handle login error
                      AppSnackbar(
                        isError: true,
                        response: e.toString(),
                      ).show(context);
                    }
                  },
                  label: 'Submit',
                  borderRadius: 20,
                  textColor: AppConst.secondary,
                  bcolor: AppConst.primary),
            )
          ],
        ));
  }
}
