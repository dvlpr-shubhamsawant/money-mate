import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/constants/color_pallet.dart';

TextFormField modalBottomSheetTextfield({controller, icon}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: icon,
      hintText: "Type here",
      hintStyle: TextStyle(fontSize: 12.sp),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.orangeColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.textColor),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.textColor),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.redColor),
      ),
    ),
  );
}
