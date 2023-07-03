import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';

class Control extends StatefulWidget {
  const Control({Key? key}) : super(key: key);

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
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

      BluetoothConnection.toAddress(selectedDevice!.address).then((newConnection) {
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

  void _sendDigit(int digit) {
  if (connection != null && connection!.isConnected) {
    Uint8List data = Uint8List.fromList([digit]);
    connection!.output.add(data);
    connection!.output.allSent.then((_) {
      print('Digit sent: $digit');
    }).catchError((error) {
      print('Failed to send digit: $error');
    });
  } else {
    print('Not connected to a Bluetooth device.');
  }
}

  @override
  void initState() {
    super.initState();
    _discoverDevices();
  }

  @override
  void dispose() {
    if (connection != null) {
      connection!.close();
    }
    super.dispose();
  }
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
                  GestureDetector(
                    onTap: () => _sendDigit(0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.primary,
                      child: AppText(txt: 'On',size: 30, color: AppConst.secondary, weight: FontWeight.w900,),
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
                    child: GestureDetector(
                      onTap: () => _sendDigit(1),
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
                    child: GestureDetector(
                      onTap: () => _sendDigit(2),
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
                    child: GestureDetector(
                      onTap: () => _sendDigit(3),
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
                    child: GestureDetector(
                      onTap: () => _sendDigit(4),
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
                    child: GestureDetector(
                      onTap: () => _sendDigit(5),
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
                    child: GestureDetector(
                      onTap: () => _sendDigit(6),
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
                    child: GestureDetector(
                      onTap: () => _sendDigit(7),
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
                  ),
                  GestureDetector(
                    onTap: () => _sendDigit(8),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppConst.grey,
                      child: AppText(txt: 'Off',size: 30, color: AppConst.secondary, weight: FontWeight.w900,),
                    ),
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
