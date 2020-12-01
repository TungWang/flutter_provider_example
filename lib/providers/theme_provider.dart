import 'package:flutter/material.dart';

class ThemeColor {
  Color color;
  String title;
  ThemeColor({this.color, this.title});
}

class ThemeColorProvider with ChangeNotifier {

  //Primary color
  Color _primaryColor = Colors.blue;
  List<ThemeColor> _primaryColors = [
    ThemeColor(color: Colors.red, title: 'Red'),
    ThemeColor(color: Colors.orange, title: 'Orange'),
    ThemeColor(color: Colors.yellow, title: 'Yellow'),
    ThemeColor(color: Colors.green, title: 'Green'),
    ThemeColor(color: Colors.blue, title: 'Blue'),
    ThemeColor(color: Colors.indigo, title: 'Indigo'),
    ThemeColor(color: Colors.purple, title: 'Purple'),
  ];

  void updatePrimaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  Color getPrimaryColor() => _primaryColor;

  List<ThemeColor> getPrimaryColors() => _primaryColors;


  //Accent color
  Color _accentColor = Colors.blueAccent;
  List<ThemeColor> _accentColors = [
    ThemeColor(color: Colors.redAccent, title: 'Red accent'),
    ThemeColor(color: Colors.orangeAccent, title: 'Orange accent'),
    ThemeColor(color: Colors.yellowAccent, title: 'Yellow accent'),
    ThemeColor(color: Colors.greenAccent, title: 'Green accent'),
    ThemeColor(color: Colors.blueAccent, title: 'Blue accent'),
    ThemeColor(color: Colors.indigoAccent, title: 'Indigo accent'),
    ThemeColor(color: Colors.purpleAccent, title: 'Purple accent'),
  ];

  void updateAccentColor(Color color) {
    _accentColor = color;
    notifyListeners();
  }

  Color getAccentColor() => _accentColor;

  List<ThemeColor> getAccentColors() => _accentColors;
}
