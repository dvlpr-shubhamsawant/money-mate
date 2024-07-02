import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/constants/app_lists.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/constants/spacing.dart';
import 'package:money_mate/constants/typography.dart';

Container categoryCardWidget(
    {color, category = "Bill", totalItems = 0, totalExpense = 0, icon}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    width: double.infinity,
    decoration: BoxDecoration(
      color: color ?? AppColors.orangeColor,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$category",
              style: TextStyle(
                color: AppColors.whitecolor,
                fontSize: 20.sp,
                fontFamily: Typo.semiBold,
              ),
            ),
            Icon(
              icon ?? AppLists.iconExpenseList[0],
              color: AppColors.whitecolor,
            ),
          ],
        ),
        Text(
          "${totalItems} items",
          style: TextStyle(
            color: AppColors.offWhitecolor,
            fontSize: 12.sp,
            fontFamily: Typo.medium,
          ),
        ),
        Spacing.heightBox(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Expense",
              style: TextStyle(
                color: AppColors.offWhitecolor,
                fontSize: 12.sp,
                fontFamily: Typo.medium,
              ),
            ),
            Text(
              "RS. $totalExpense",
              style: TextStyle(
                color: AppColors.whitecolor,
                fontSize: 18.sp,
                fontFamily: Typo.semiBold,
              ),
            ),
          ],
        ),
        Spacing.heightBox(8),
      ],
    ),
  );
}
