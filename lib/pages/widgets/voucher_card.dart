import 'package:flutter/material.dart';
import 'package:loyalty_project/commponents/theme.dart';
import 'package:loyalty_project/models/voucher.dart';


class VoucherCard extends StatelessWidget {
  final VoucherModel voucher;

  VoucherCard(this.voucher);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 180,
        width: 290,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  voucher.imageUrl,
                  width: 290,
                  height: 182,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              voucher.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
