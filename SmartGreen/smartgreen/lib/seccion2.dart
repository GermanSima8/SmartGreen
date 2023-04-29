import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class seccion2 extends StatefulWidget {
  const seccion2({super.key});

  @override
  State<seccion2> createState() => _seccion2State();
}

class _seccion2State extends State<seccion2> {
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
