import 'package:flutter/material.dart';
import 'package:loyalty_project/commponents/theme.dart';
import 'package:loyalty_project/pages/home/profile_page.dart';
import 'package:loyalty_project/pages/home/rewards_page.dart';
import 'package:loyalty_project/pages/home/transactions_page.dart';

import 'home_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //Widget cardButton() {
    // return FloatingActionButton.extended(
    //   onPressed: () {},
    //   icon: Container(child: Icon(Icons.qr_code_scanner)),
    //   label: Text('Scanner'),
    // );
    // return FloatingActionButton(
    //   onPressed: () {
    //     Navigator.pushNamed(context, '/scanner');
    //   },
    //   backgroundColor: backgroundColor6,
    //   child: Container(
    //     child: Icon(
    //       Icons.qr_code_scanner,
    //       color: backgroundColor3,
    //     ),
    //   ),
    // );
    //}

    Widget customBottomNav() {
      return ClipRRect(
        //borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          color: backgroundColor6,
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          //clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor6,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 21,
                    color:
                        currentIndex == 0 ? backgroundColor3 : bottomNavColor,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_chat.png',
                    width: 20,
                    color:
                        currentIndex == 1 ? backgroundColor3 : bottomNavColor,
                  ),
                ),
                label: 'Rewards',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_cart.png',
                    width: 18,
                    color:
                        currentIndex == 2 ? backgroundColor3 : bottomNavColor,
                  ),
                ),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 18,
                    color:
                        currentIndex == 3 ? backgroundColor3 : bottomNavColor,
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return RewardsPage();
          break;
        case 2:
          return TransactionPage();
          break;
        case 3:
          return ProfilPage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor4,
      //floatingActionButton: cardButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
