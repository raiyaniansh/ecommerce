import 'package:flutter/material.dart';

class SecondProvider extends ChangeNotifier
{
  int i=1;

  void Changeadd()
  {
    i++;
    notifyListeners();
  }
  void Changeremove()
  {
    if(i>1)
      {
        i--;
        notifyListeners();
      }
  }
}