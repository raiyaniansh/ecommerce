import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier
{
  int i = 0;

  void ChangeIndex(int index)
  {
    i = index;
    notifyListeners();
  }
}