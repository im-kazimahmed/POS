import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF121212);
const secondaryColor = Color(0xFF000000);
const tertiaryColor = Color(0xFFeaeaea);
const backgroundColor = Color(0xFFFFFFFF);
final grayLightOpacityColor = const Color(0xFFFFFFFF).withOpacity(0.3);
const textHeadingColor = Color(0xFFFFFFFF);
const grayTextColor = Color(0xFF737373);
const grayColor = Color(0xFF1f1f1f);
const secondaryGrayColor = Color(0xFF2d2d2d);

const Color backColor = Color(0xffF6F6F6);
const Color mainBlueColor = Color(0xff005BE0);
const Color blueDarkColor = Color(0xff252B5C);
const Color textColor = Color(0xff53587A);
const Color greyColor = Color(0xffAAAAAA);
const Color whiteColor = Color(0xffFFFFFF);

const defaultRadius = 10.0;
const defaultPadding = 16.0;
const defaultWidth = 32.0;
const defaultHeight = 12.0;
const sideMenuLogoPadding = 30.5;
const headerPaddingDesktop = 36.5;
const headerPaddingMobile = 26.0;
// const defaultRadius = 30.0;

TextStyle raleWayStyle = GoogleFonts.raleway();

Color getContrastingTextColor(Color backgroundColor) {
  // Calculate the luminance of the background color
  double luminance = backgroundColor.computeLuminance();
  // Return black for light background and white for dark background
  return luminance > 0.5 ? Colors.black : Colors.white;
}
