import 'package:flutter/material.dart';
import 'package:loyalty_project/commponents/theme.dart';
import 'package:loyalty_project/pages/widgets/poin_card_rewards.dart';


class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor4,
        centerTitle: true,
        title: Text(
          'My Rewards',
          style: whiteTextStyle.copyWith(fontSize: 26, fontWeight: semiBold),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget redem() {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Redeem new rewards, you can use 437 ',
                    style: whiteTextStyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    ' active points',
                    style: whiteTextStyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'See rewards you have already redeemed',
                    style: whiteTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget pointsCard() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [
                  PoointsCardRewards(),
                  PoointsCardRewards(),
                  PoointsCardRewards(),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget pointsCard2() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [
                  PoointsCardRewards(),
                  PoointsCardRewards(),
                  PoointsCardRewards(),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        redem(),
        pointsCard(),
        SizedBox(
          height: 20,
        ),
        pointsCard2(),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
