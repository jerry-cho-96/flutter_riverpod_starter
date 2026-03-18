import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme buildAppTextTheme() {
  return GoogleFonts.ibmPlexSansKrTextTheme().copyWith(
    headlineMedium: GoogleFonts.ibmPlexSansKr(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.ibmPlexSansKr(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.ibmPlexSansKr(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.ibmPlexSansKr(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.ibmPlexSansKr(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}
