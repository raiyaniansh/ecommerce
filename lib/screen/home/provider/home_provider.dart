import 'package:apipost/screen/home/modal/home_modal.dart';
import 'package:apipost/utils/api_helper.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{

  List cart = [];

  Future<List> Apicalling()
  async {
    Api api = Api();
    List homeModal = await api.ApiCalling();
    return homeModal;
  }

  void addCart(HomeModal m1)
  {
    cart.add(m1);
    notifyListeners();
  }

  void removeCart(int index)
  {
    cart.removeAt(index);
    notifyListeners();
  }
}