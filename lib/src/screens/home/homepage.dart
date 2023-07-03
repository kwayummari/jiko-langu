import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:jiko_langu/src/utils/app_const.dart';
import 'package:jiko_langu/src/widgets/app_base_screen.dart';
import 'package:jiko_langu/src/widgets/app_text.dart';
import 'package:jiko_langu/src/widgets/app_toggle_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool value = false;
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  @override
  void initState() {
    super.initState();
    bluetooth.state.then((state) {
      setState(() {
        value = (state == BluetoothState.STATE_ON);
      });
    });
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
  Widget build(BuildContext context) {
    return AppBaseScreen(
      bgcolor: AppConst.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppConst.primary,
        centerTitle: true,
        title: AppText(
          txt: 'Welcome back John Doe',
          size: 15,
          color: AppConst.secondary,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              color: AppConst.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText(
                txt:
                    'Welcome to JIKO LANGU! Control your stove at your pace and prepare your food freely as you wish',
                size: 20,
                color: AppConst.secondary,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/home.jpg'),
          ),
          SizedBox(
            height: 50,
          ),
          AppToggleButton(
            title: 'Bluetooth',
            value: value,
            onChanged: _toggleBluetooth,
          ),
        ],
      ),
    );
  }
}
