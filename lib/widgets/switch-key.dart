import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/robot-provider.dart';

class SwitchKey extends StatefulWidget {
  const SwitchKey({Key? key}) : super(key: key);

  @override
  State<SwitchKey> createState() => _SwitchKeyState();
}

class _SwitchKeyState extends State<SwitchKey> {

  @override
  Widget build(BuildContext context) {
    // return a switch
    return Switch(
      value: Provider.of<ControllerProvider>(context).getTurn90(),
      onChanged: (value) {
        Provider.of<ControllerProvider>(context, listen: false).setTurn90(value);
        print("turn90: ${Provider.of<ControllerProvider>(context, listen: false).getTurn90()} from switch-key.dart");
      },
    );
  }
}
