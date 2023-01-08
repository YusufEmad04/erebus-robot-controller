import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robot_controller_2/providers/robot-provider.dart';

// import http package
import 'package:http/http.dart' as http;

class ArrowKey extends StatelessWidget {
  final String command;

  ArrowKey(this.command, {Key? key}) : super(key: key);

  late BuildContext _context;

  void _sendGetRequest(String command) async {
    String _command = command;
    bool turn90 =
        Provider.of<ControllerProvider>(_context, listen: false).getTurn90();
    print("turn90: $turn90 from arrow-key.dart");

    if ((command == "left" || command == "right") && turn90 == true) {
      _command = command + "90";
    }

    var url = Uri.parse(
        'http://${Provider.of<ControllerProvider>(_context, listen: false).getUrl()}/$_command');
    await http.get(url);
  }

  Widget _createButton(String command) {
    IconData icon;
    switch (command) {
      case 'forward':
        icon = Icons.arrow_upward;
        break;
      case 'backward':
        icon = Icons.arrow_downward;
        break;
      case 'left':
        icon = Icons.arrow_back;
        break;
      case 'right':
        icon = Icons.arrow_forward;
        break;
      default:
        icon = Icons.stop;
    }
    //create a button with rounded corners with animation on press
    return Container(
      color: Colors.grey[350],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          onTapUp: (_) => _sendGetRequest("stop"),
          onTapDown: (_) {
            _sendGetRequest(command);
          },
          child: SizedBox(
            width: 100.0,
            height: 100.0,
            child: command == "stop"
                ? const Center(
                child: Text(
                    "STOP",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            )
                : Icon(
                    icon,
                    size: 50.0,
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return _createButton(command);
  }
}
