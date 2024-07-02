import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/constants/app_lists.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/constants/spacing.dart';
import 'package:money_mate/models/expense_data_model.dart';

Container expenseShowCard({
  // icon = Icons.local_dining,
  // title = "Grocery",
  // category = "Shopping",
  // amount = 200,
  // date,

  ExpenseDataModel? model,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    decoration: BoxDecoration(color: AppColors.whitecolor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            model!.category == "Food"
                ? Icon(
                    AppLists.iconExpenseList[0],
                  )
                : model.category == "Bill"
                    ? Icon(
                        AppLists.iconExpenseList[1],
                      )
                    : model.category == "Shopping"
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
                  "${model.title}",
                  style: TextStyle(fontSize: 16.sp),
                ),
                Text(
                  "${model.category}",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
        Text(
          "Rs ${model.amount}",
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ],
    ),
  );
}
