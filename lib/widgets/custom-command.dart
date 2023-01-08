import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/robot-provider.dart';

class CustomCommand extends StatelessWidget {
  CustomCommand({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  void _sendGetRequest(String command, BuildContext context) async {

    String url = "http://${Provider.of<ControllerProvider>(context, listen: false).getUrl()}/$command";

    await http.get(Uri.parse(url));

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Custom Command',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _sendGetRequest(_controller.text, context);
              }
            },
            child: const Text("Send"),
          ),
        )
      ],
    );
  }
}
