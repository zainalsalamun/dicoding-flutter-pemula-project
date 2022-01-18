import 'package:flutter/material.dart';
import 'package:loyalty_project/commponents/theme.dart';
import 'package:loyalty_project/models/voucher.dart';
import 'package:loyalty_project/pages/widgets/voucher_card.dart';


class VoucherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        bottom: true,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: 24,
            ),
            VoucherCard(
              VoucherModel(
                id: 1,
                name: 'Diskon Caseback',
                imageUrl: 'assets/carouselslide1.webp',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            VoucherCard(
              VoucherModel(
                id: 2,
                name: 'Diskon Caseback',
                imageUrl: 'assets/promo_starbucks_dua.jpeg',
                isPopular: true,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            VoucherCard(
              VoucherModel(
                id: 3,
                name: 'Diskon Caseback',
                imageUrl: 'assets/carouselslide3.webp',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            VoucherCard(
              VoucherModel(
                id: 4,
                name: 'Diskon Caseback',
                imageUrl: 'assets/promo_starbucks.jpeg',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            VoucherCard(
              VoucherModel(
                id: 5,
                name: 'Diskon Caseback',
                imageUrl: 'assets/promo_starbucks_dua.jpeg',
                isPopular: true,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            VoucherCard(
              VoucherModel(
                id: 6,
                name: 'Diskon Caseback',
                imageUrl: 'assets/promo_starbucks_tiga.jpeg',
              ),
            ),
            SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
