import 'package:flutter/material.dart';
import 'package:loyalty_project/commponents/theme.dart';

class MerchantAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/merchant-all');
      },
      child: Container(
        color: backgroundColor6,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 25,
            left: 10,
            right: 10,
            bottom: 25,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  'assets/vans.png',
                  width: 80,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Vans Store',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Gandaria City',
                      style: priceTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
