import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  late Color _myCustomColor;

  Color get myColor => _myCustomColor;

  ThemeNotifier() {
    _myCustomColor = Colors.blue;
  }

  changeColor(Color _color) {
    _myCustomColor = _color;
    print(_color.toString());
    notifyListeners();
  }
}
