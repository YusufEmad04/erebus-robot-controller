import 'package:flutter/material.dart';

class ControllerProvider extends ChangeNotifier {

  String _url = "";
  bool _turn_90 = true;

  void setUrl(String url) {
    _url = url;
  }

  String getUrl() {
    return _url;
  }

  void setTurn90(bool turn) {
    _turn_90 = turn;
    notifyListeners();
  }

  bool getTurn90() {
    return _turn_90;
  }
}