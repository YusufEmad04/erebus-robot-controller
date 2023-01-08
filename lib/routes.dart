import 'package:flutter/material.dart';
import 'package:robot_controller_2/routes/main-page.dart';
import 'package:robot_controller_2/routes/start-page.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case StartPage.routeName:
        return MaterialPageRoute(builder: (_) => StartPage());
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return MaterialPageRoute(builder: (_) => StartPage());
    }

  }
}
