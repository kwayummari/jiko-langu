import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_button.dart';
import 'package:jiko_langu/src/widgets/app_input_text.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';
import 'package:jiko_langu/src/widgets/app_toggle_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  BluetoothConnection? connection;
  bool isConnected = false;
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevice;

  Future<void> _discoverDevices() async {
    devices = await FlutterBluetoothSerial.instance.getBondedDevices();
    setState(() {});
  }

  Future<void> _connectToDevice() async {
    if (selectedDevice == null) {
      print('No device selected.');
      return;
    }

    try {
      if (connection != null) {
        await connection!.close();
        setState(() {
          connection = null;
          isConnected = false;
        });
      }

      BluetoothConnection.toAddress(selectedDevice!.address)
          .then((newConnection) {
        setState(() {
          connection = newConnection;
          isConnected = true;
        });
      }).catchError((error) {
        print('Failed to connect: $error');
      });
    } catch (error) {
      print('Failed to connect: $error');
    }
  }

  void _sendDigit(int digit, int digit1) {
    if (connection != null && connection!.isConnected) {
      Uint8List data = Uint8List.fromList([digit]);
      Uint8List data1 = Uint8List.fromList([digit1]);
      connection!.output.add(data);
      connection!.output.add(data1);
      connection!.output.allSent.then((_) {
        print('Digit sent: $digit');
      }).catchError((error) {
        print('Failed to send digit: $error');
      });
    } else {
      print('Not connected to a Bluetooth device.');
    }
  }

  bool value = false;
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  @override
  void initState() {
    super.initState();
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        value = (state == BluetoothState.STATE_ON);
      });
    });
    _discoverDevices();
  }

  void _toggleBluetooth(bool newValue) async {
    if (newValue) {
      await bluetooth.requestEnable();
    } else {
      await bluetooth.requestDisable();
    }
    setState(() {
      value = newValue;
    });
  }

  @override
  void dispose() {
    if (connection != null) {
      connection!.close();
    }
    super.dispose();
  }

  TextEditingController temp = TextEditingController();
  TextEditingController time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: CircleAvatar(backgroundColor: AppConst.greyshade200),
          title: AppText(
            txt: 'Welcome Kwayu',
            size: 15,
            color: AppConst.black,
          ),
          subtitle: AppText(
            txt: 'ID123456',
            size: 15,
            color: AppConst.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        AppToggleButton(
          title: 'Bluetooth',
          value: value,
          onChanged: _toggleBluetooth,
        ),
        SizedBox(
          height: 20,
        ),
        AppInputText(
            textfieldcontroller: temp,
            isemail: false,
            fillcolor: AppConst.transparent,
            label: 'Enter Temperature',
            obscure: false),
        AppInputText(
            textfieldcontroller: time,
            isemail: false,
            fillcolor: AppConst.transparent,
            label: 'Enter Time',
            obscure: false),
        AppButton(
            onPress: () =>
                _sendDigit(int.parse(temp.text), int.parse(time.text)),
            label: 'Submit',
            borderRadius: 20,
            textColor: AppConst.black,
            bcolor: AppConst.primary),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => null,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppConst.primary,
                  child: AppText(
                    txt: 'On',
                    size: 30,
                    color: AppConst.black,
                    weight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => null,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.transparent,
                    child: AppText(
                      txt: '1',
                      size: 30,
                      color: AppConst.black,
                      weight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => null,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.transparent,
                    child: AppText(
                      txt: '2',
                      size: 30,
                      color: AppConst.black,
                      weight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => null,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.transparent,
                    child: AppText(
                      txt: '3',
                      size: 30,
                      color: AppConst.black,
                      weight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => null,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.transparent,
                    child: AppText(
                      txt: '4',
                      size: 30,
                      color: AppConst.black,
                      weight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => null,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.transparent,
                    child: AppText(
                      txt: '5',
                      size: 30,
                      color: AppConst.black,
                      weight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => null,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.transparent,
                    child: AppText(
                      txt: '6',
                      size: 30,
                      color: AppConst.black,
                      weight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => null,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppConst.transparent,
                    child: AppText(
                      txt: '7',
                      size: 30,
                      color: AppConst.black,
                      weight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => null,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppConst.grey,
                  child: AppText(
                    txt: 'Off',
                    size: 30,
                    color: AppConst.black,
                    weight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    ));
  }
}
