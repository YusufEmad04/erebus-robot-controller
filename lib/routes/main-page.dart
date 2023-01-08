import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robot_controller_2/providers/robot-provider.dart';
import 'package:robot_controller_2/widgets/arrow-key.dart';
import 'package:robot_controller_2/widgets/custom-command.dart';
import 'package:robot_controller_2/widgets/switch-key.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class MainPage extends StatelessWidget {

  static const String routeName = 'main-page';

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Robot Controller"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 432,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text("Turn 90  "),
                      ),
                      RepaintBoundary(child: SwitchKey())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ArrowKey("forward"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ArrowKey("left"),
                      ArrowKey("stop"),
                      ArrowKey("right"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ArrowKey("backward")
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 23,
            ),

            CustomCommand(),
            const SizedBox(
              height: 50,
            ),
            RepaintBoundary(
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Mjpeg(
                            isLive: true,
                            stream: "http://${Provider.of<ControllerProvider>(context, listen: false).getUrl()}/video_feed",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Mjpeg(
                            isLive: true,
                            stream: "http://${Provider.of<ControllerProvider>(context, listen: false).getUrl()}/video_feed2",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
