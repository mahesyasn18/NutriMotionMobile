import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color greenColor = const Color(0xff4CAF50);
Color darkGreenColor = const Color(0xff36622B);
Color blackColor = const Color(0xff1A1717).withOpacity(0.8);
Color primaryButtonColor = const Color(0xff319F43);
Color whiteColor = const Color(0xffFFFFFF);
Color blackSecondaryColor = Color.fromRGBO(26, 23, 23, 1).withOpacity(0.6);
Color grayColor = const Color(0xffA6A9AB);
Color redColor = const Color(0xffEC6767);

TextStyle blackPrimaryTextStyle = GoogleFonts.plusJakartaSans(
  color: blackColor,
);

TextStyle greenPrimaryTextStyle = GoogleFonts.plusJakartaSans(
  color: greenColor,
);

TextStyle greenSecondaryTextStyle = GoogleFonts.montserrat(
  color: greenColor,
);

TextStyle darkGreenPrimaryTextStyle = GoogleFonts.montserrat(
  color: darkGreenColor,
);

TextStyle secondaryBlackTextStyle = GoogleFonts.montserrat(
  color: blackSecondaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
