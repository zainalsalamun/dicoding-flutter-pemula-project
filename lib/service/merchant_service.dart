import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loyalty_project/main.dart';
import 'package:loyalty_project/models/merchant_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MerchantService {
  String baseUrl = 'http://192.168.1.5:8000/api/merchant?page=1&perpage=10';

  SharedPreferences get token => null;

  Future<void> getPref() async {
    SharedPreferences prefs = localStorage;
    prefs = token;
    //print(prefs.get('token'));
    //print(prefs);
  }

  Future<List<MerchantModel>> getMerchant() async {
    getPref();
    var url = '$baseUrl/page=1&perpage=10';

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      url,
      headers: headers,
      //body: body,
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<MerchantModel> merchant = [];
      print(response.body);
      for (var item in data) {
        merchant.add(MerchantModel.fromJson(item));
      }
      return merchant;
    } else {
      throw Exception('Gagal get products');
    }
  }
}
