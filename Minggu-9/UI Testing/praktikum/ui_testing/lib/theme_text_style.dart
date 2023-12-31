import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_app/theme_color.dart';

class ThemeTextStyle {
  TextStyle m3DisplayLarge = GoogleFonts.roboto(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    color: ThemeColor().headLine,
  );

  TextStyle m3HeadlineSmall = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: ThemeColor().headLine,
  );

  TextStyle m3BodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().supportingText
  );

  TextStyle m3BodySmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ThemeColor().supportingText,
  );

  TextStyle m3BodyLarge = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ThemeColor().supportingText,
  );

  TextStyle m3LabelLarge = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ThemeColor().labelTextColor,
  );
}