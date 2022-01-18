import 'package:flutter/material.dart';
import 'package:loyalty_project/pages/home/main_page.dart';
import 'package:loyalty_project/pages/home/points_page.dart';
import 'package:loyalty_project/pages/home/transactions_page.dart';
import 'package:loyalty_project/pages/screens/mercchant_all_page.dart';
import 'package:loyalty_project/pages/screens/scanner.dart';
import 'package:loyalty_project/pages/screens/sign_in_page.dart';
import 'package:loyalty_project/pages/screens/sign_up_page.dart';
import 'package:loyalty_project/pages/screens/splash_page.dart';
import 'package:loyalty_project/pages/screens/voucher_page.dart';
import 'package:loyalty_project/provider/auth_provider.dart';
import 'package:loyalty_project/provider/merchant_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'commponents/credit_card.dart';

void main() {
  runApp(MyApp());
}

SharedPreferences localStorage;

class MyApp extends StatelessWidget {
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
    return localStorage;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MerchantProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/transaction': (context) => TransactionPage(),
          '/card': (context) => CreditCard(),
          '/points ': (context) => PointsPage(),
          '/voucher': (context) => VoucherPage(),
          '/scanner': (context) => Scanner(),
          '/merchant-all': (context) => MerchantPageAll(),
          //'/activation': (context) => ActivationPage(),
        },
      ),
    );
  }
}
