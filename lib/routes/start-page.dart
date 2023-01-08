import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:robot_controller_2/providers/robot-provider.dart';
import 'package:robot_controller_2/routes/main-page.dart';
import 'package:robot_controller_2/widgets/constants.dart';

class StartPage extends StatelessWidget {

  static const String routeName = 'start-page';

  StartPage({Key? key}) : super(key: key);

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Robot Controller'),
      ),
      body: ListView(

        children: [
          const SizedBox(
            height: 150,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "IP Address :",
                style: TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold
                ),
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: t1,
                      keyboardType: TextInputType.phone,
                      decoration: Constants.inputDecoration,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                  child: Text(".", style: Constants.textStyle,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: t2,
                        keyboardType: TextInputType.phone,
                        decoration: Constants.inputDecoration,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                  child: Text(".", style: Constants.textStyle,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: t3,
                        keyboardType: TextInputType.phone,
                        decoration: Constants.inputDecoration,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                  child: Text(".", style: Constants.textStyle,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: t4,
                        keyboardType: TextInputType.phone,
                        decoration: Constants.inputDecoration,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                  child: Text(":", style: Constants.textStyle,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: t5,
                        keyboardType: TextInputType.phone,
                        decoration: Constants.inputDecoration,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: ElevatedButton(
                  onPressed: () {

                    final controllers = [t1, t2, t3, t4, t5];

                    for(var i in controllers){
                      if (i.text.isEmpty){
                        Fluttertoast.showToast(msg: "enter ip address correctly");
                        return;
                      }
                    }

                    String url = "${t1.text}.${t2.text}.${t3.text}.${t4.text}:${t5.text}";

                    Provider.of<ControllerProvider>(context, listen: false).setUrl(url);

                    Navigator.of(context).pushNamed(MainPage.routeName);

                  },
                  child: const Text("START"),
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}
