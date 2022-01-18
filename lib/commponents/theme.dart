import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;

//Color primaryColor = Color(0xff6c5ecf);
Color primaryColor = Color(0xff2c96f1);
Color secondaryColor = Color(0xff38abbe);
Color alertColor = Color(0xffed6363);
Color priceColor = Color(0xff2c96f1);
Color backgroundColor1 = Color(0xfff1f0f2);
Color backgroundColor2 = Color(0xff38abbe);
//Color backgroundColor3 = Color(0xff252836);
Color backgroundColor3 = Color(0xff23C1EC);
//Color backgroundColor3 = Colors.blue;
Color primaryTextColor = Color(0xfff1f0f2);
Color secondaryTextColor = Color(0xff999999);
Color subtitleColor = Color(0XFF504F5E);
//Color backgroundColor4 = Color(0xff252836);
Color backgroundColor4 = Color(0xff252836);
Color backgroundColor5 = Color(0xff38abbe);
Color backgroundColor6 = Color(0xffECEDEF);
Color colorTransparant = Colors.transparent;
Color blackColor = Color(0xff2e2e2e);
Color bottomNavColor = Color(0xff808191);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: Colors.black,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: Colors.white,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: Colors.black,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(color: secondaryTextColor);

TextStyle priceTextStyle = GoogleFonts.poppins(color: priceColor);

TextStyle purpleTextStyle = GoogleFonts.poppins(color: primaryColor);

TextStyle subtitleTextStyle = GoogleFonts.poppins(color: subtitleColor);
TextStyle alertTextStyle = GoogleFonts.poppins(color: alertColor);

const TextStyle whiteCardNumberStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);
FontWeight ligth = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

class ColorHelper {
  static Color keepOrWhite(Color textColor, Color backgroundColor,
      [Color alternateColor]) {
    if (isDark(textColor) && isDark(backgroundColor))
      return alternateColor ?? Colors.white;
    return textColor;
  }

  static bool isDark(Color color) {
    return color.computeLuminance() < 0.5;
  }
}
