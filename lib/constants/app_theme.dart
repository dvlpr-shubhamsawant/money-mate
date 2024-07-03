import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/constants/typography.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: AppColors.offWhitecolor),
      fontFamily: Typo.regular,
      scaffoldBackgroundColor: AppColors.offWhitecolor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.orangeColor,
        foregroundColor: AppColors.whitecolor,
        shape: CircleBorder(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orangeColor),
          borderRadius: BorderRadius.circular(12.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(12.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.orangeColor,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: Typo.semiBold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ));
}
