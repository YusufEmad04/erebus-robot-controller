import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robot_controller_2/providers/robot-provider.dart';
import 'package:robot_controller_2/routes.dart';
import 'package:robot_controller_2/routes/start-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ControllerProvider>(
      create: (context) => ControllerProvider(),
      child: MaterialApp(
        title: 'Robot Controller',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: StartPage.routeName,
      ),
    );
  }
}

