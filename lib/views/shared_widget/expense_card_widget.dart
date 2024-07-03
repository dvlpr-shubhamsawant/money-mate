import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/constants/app_lists.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/constants/spacing.dart';

expenseShowCard(
    {icon = Icons.local_dining,
    title = "Grocery",
    category = "Shopping",
    amount = 200,
    date,
    ontap,
    delete,
    update

    // ExpenseDataModel? model,
    }) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(color: AppColors.whitecolor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              category == "Food"
                  ? Icon(
                      AppLists.iconExpenseList[0],
                    )
                  : category == "Bill"
                      ? Icon(
                          AppLists.iconExpenseList[1],
                        )
                      : category == "Shopping"
                          ? Icon(
                              AppLists.iconExpenseList[2],
                            )
                          : Icon(
                              AppLists.iconExpenseList[3],
                            ),
              Spacing.widthBox(14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "$category",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "RS $amount",
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              Spacing.widthBox(20),
              GestureDetector(
                onTap: delete,
                child: Icon(
                  Icons.delete,
                ),
              ),
              Spacing.widthBox(10),
              GestureDetector(
                onTap: update,
                child: Icon(
                  Icons.edit,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
