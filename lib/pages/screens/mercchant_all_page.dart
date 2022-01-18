import 'dart:ffi';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_project/commponents/theme.dart';
import 'package:loyalty_project/pages/widgets/poin_card_rewards.dart';


class MerchantPageAll extends StatefulWidget {
  @override
  _MerchantPageAllState createState() => _MerchantPageAllState();
}

class _MerchantPageAllState extends State<MerchantPageAll> {
  List images = [
    'assets/vans_coupon.jpeg',
    'assets/vans_promo.jpg',
  ];
  List logomerchant = [
    'assets/m_redeem.png',
    'assets/m_referral.png',
    'assets/m_contact_us.png',
    'assets/m_history.png',
  ];

  int currentIndex = 0;
  bool isWislist = false;

  @override
  Widget build(BuildContext context) {
    Future<Void> showSuccesDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor1,
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
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'succesfuly',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Back to menu',
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
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffc4c4c4),
        ),
      );
    }

    Widget categoryCard(String imageUrl) {
      return Column(
        children: [
          Container(
            width: 54,
            height: 54,
            margin: EdgeInsets.only(
              right: 16,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: backgroundColor4,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor4,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            child: CarouselSlider(
              items: images
                  .map(
                    (image) => Image.asset(image,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover),
                  )
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: 480 / 243,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 17,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: primaryTextColor,
        ),
        child: Column(
          children: [
            //Note header
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VANS',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 10,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: alertColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Waffle Points',
                    style: whiteTextStyle,
                  ),
                  Text(
                    '100 Points',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Text(
                      'Category',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: logomerchant.map((image) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                              left: index == 0 ? defaultMargin : 25),
                          child: categoryCard(image),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrtiption',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Get 50.000 points by Refering Your Freinds',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: ligth,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            // Note Button
            //Container(
            //width: double.infinity,
            //margin: EdgeInsets.all(defaultMargin),
            //child: Row(
            //children: [
            //Expanded(
            //child: Container(
            //height: 54,
            // child: TextButton(
            //   onPressed: () {
            //     showSuccesDialog();
            //   },
            //   style: TextButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       backgroundColor: primaryColor),
            //   child: Text(
            //     'REFER NOW',
            //     style: whiteTextStyle.copyWith(
            //       fontSize: 16,
            //       fontWeight: semiBold,
            //     ),
            //   ),
            // ),
            // ),
            // )
            // ],
            //),
            //),
          ],
        ),
      );
    }

    Widget pointsCard() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
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

    return Scaffold(
        backgroundColor: backgroundColor1,
        body: ListView(
          children: [
            header(),
            content(),
            pointsCard(),
          ],
        ));
  }
}
