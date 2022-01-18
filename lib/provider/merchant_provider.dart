import 'package:flutter/material.dart';
import 'package:loyalty_project/models/merchant_model.dart';
import 'package:loyalty_project/service/merchant_service.dart';


class MerchantProvider with ChangeNotifier {
  List<MerchantModel> _merchant = [];
  List<MerchantModel> get merchant => _merchant;

  set merchant(List<MerchantModel> merchant) {
    _merchant = merchant;
    notifyListeners();
  }

  Future<void> getMerchant() async {
    try {
      List<MerchantModel> merchant = await MerchantService().getMerchant();

      _merchant = merchant;
    } catch (e) {
      print(e);
    }
  }
}
