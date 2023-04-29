import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class seccion1 extends StatefulWidget {
  const seccion1({super.key});

  @override
  State<seccion1> createState() => _seccion1State();
}

class _seccion1State extends State<seccion1> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        });
  }
}
