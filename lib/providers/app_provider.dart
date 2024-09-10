import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  // Any state you might need in the future can go here
  String appTitle = 'Glam Gas';

  // Example of changing state
  void updateTitle(String newTitle) {
    appTitle = newTitle;
    notifyListeners();
  }
}
