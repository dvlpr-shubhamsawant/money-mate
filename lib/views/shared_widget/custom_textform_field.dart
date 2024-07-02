import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/constants/color_pallet.dart';

TextFormField customTextformField({
  label,
  icon,
  color,
}) {
  return TextFormField(
    // cursorColor: AppColo
    // rs.orangeColor,
    cursorHeight: 20,
    cursorWidth: 1.3,
    decoration: InputDecoration(
      labelText: "$label",
      labelStyle: TextStyle(fontSize: 12.sp, color: AppColors.textColor),
      hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.textColor),
      prefixIcon: Icon(icon),
    ),
  );
}
