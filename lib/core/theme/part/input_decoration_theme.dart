import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme_extension/color_scheme.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),

    hintStyle: GoogleFonts.nunito(
      color: const Color(0xFF777980),
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),

    labelStyle: GoogleFonts.nunito(
      color: AppColorScheme.onSurface,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    ),

    floatingLabelStyle: GoogleFonts.nunito(
      color: AppColorScheme.primaryColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    ),

    errorStyle: GoogleFonts.nunito(
      color: AppColorScheme.errorColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColorScheme.borderColor, width: 1),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColorScheme.primaryColor, width: 1.5),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColorScheme.errorColor, width: 1.2),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColorScheme.errorColor, width: 1.5),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(
        color: AppColorScheme.borderColor.withOpacity(0.5),
      ),
    ),
  );
}
