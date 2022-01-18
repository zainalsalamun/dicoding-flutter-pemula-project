import 'package:flutter/material.dart';
import 'package:loyalty_project/commponents/theme.dart';

class PointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Earn points',
                    style: whiteTextStyle.copyWith(
                        fontSize: 26, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'My Account',
                    style: whiteTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: whiteTextStyle.copyWith(fontSize: 13),
            ),
            Text(
              '120',
              style: whiteTextStyle.copyWith(fontSize: 13),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: backgroundColor3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/edit-profile');
            //   },
            //   child: menuItem(
            //     'Total Earned Points',
            //   ),
            // ),
            menuItem(
              'Total Earned Points',
            ),
            menuItem(
              'Actives Points',
            ),
            menuItem(
              'Used points',
            ),
            menuItem(
              'Locked Points',
            ),
            menuItem(
              'Expired Points',
            ),
            menuItem(
              'Transaction Value',
            ),
            menuItem('Current Discount')
          ],
        ),
      ));
    }

    return ListView(
      children: [
        header(),
        content(),
      ],
    );
  }
}
