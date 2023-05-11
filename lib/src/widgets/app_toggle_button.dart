import 'package:flutter/material.dart';
class AppToggleButton extends StatelessWidget {
  final String title;
  final bool value;
  final ValueSetter<bool> onChanged;
  AppToggleButton({
    required this.title,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(title),
          SizedBox(width: 16.0),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

