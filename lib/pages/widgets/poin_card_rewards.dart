import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:loyalty_project/commponents/theme.dart';

class PoointsCardRewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        width: 215,
        height: 208,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bottomNavColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Diskon campaign',
                    style: blackTextStyle.copyWith(
                        fontSize: 15, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'All time active',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '15 POINTS',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        showSuccesDialog();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(),
                      ),
                      child: Text(
                        'REDEEM REWARDS',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Void> showSuccesDialog() async {
    return showDialog(
      builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width - (2 * defaultMargin),
        child: AlertDialog(
          backgroundColor: backgroundColor3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: primaryTextColor,
                    ),
                  ),
                ),
                // Image.asset(
                //   'assets/icon_success.png',
                //   width: 100,
                // ),
                // SizedBox(
                //   height: 12,
                // ),
                // Text(
                //   'Hurray :)',
                //   style: primaryTextStyle.copyWith(
                //     fontSize: 18,
                //     fontWeight: semiBold,
                //   ),
                // ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Please confirm reward usage',
                  style: secondaryTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 154,
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/cart');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Yes',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      context: null,
    );
  }
}
