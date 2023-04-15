import 'dart:convert';

import 'package:apipost/screen/home/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List> ApiCalling() async {
    String? link = 'https://apidatahub.000webhostapp.com/MyShop/API/products.php';
    Uri uri = Uri.parse(link);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    List homemodal = json.map((e)=>HomeModal.fromJson(e)).toList();
    return homemodal;
  }
}
