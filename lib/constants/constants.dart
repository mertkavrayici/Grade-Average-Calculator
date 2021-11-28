
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Constants{

  static const  primaryColor = Colors.indigo;
  static const  headerText ="Ortalama Hesapla";
  static final textStyle=GoogleFonts.quicksand(
    fontSize: 24,fontWeight: FontWeight.w900,color: primaryColor
  );
  static BorderRadius borderRadius=BorderRadius.circular(16);

  static final lessonCountStyle= GoogleFonts.quicksand(
    fontSize: 16,fontWeight: FontWeight.w600,color: primaryColor
  );

  static final averageStyle= GoogleFonts.quicksand(
      fontSize: 55,fontWeight: FontWeight.w800,color: primaryColor
  );
}