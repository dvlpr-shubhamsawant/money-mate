import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/constants/app_lists.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/constants/spacing.dart';
import 'package:money_mate/constants/typography.dart';
import 'package:money_mate/controllers/home_controller.dart';
import 'package:money_mate/views/shared_widget/expense_card_widget.dart';
import 'package:money_mate/views/shared_widget/modal_bottom_sheet_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Spacing.screenPadding,
        width: double.infinity,
        child: Consumer<HomeController>(builder: (context, controller, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.heightBox(60),
                // balance and name card
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      color: AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LISHA THOMAS",
                        style: TextStyle(
                          color: AppColors.offWhitecolor,
                          fontFamily: Typo.medium,
                          fontSize: 16.sp,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Expense",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.offWhitecolor,
                            ),
                          ),
                          Spacing.heightBox(4),
                          Text(
                            "Rs 2000",
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: AppColors.offWhitecolor,
                              fontFamily: Typo.semiBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // list of expenses
                Spacing.heightBox(14),
                Text(
                  "Today",
                  style: TextStyle(),
                ),
                Spacing.heightBox(12),
                // Expense list
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return expenseShowCard(
                      model: controller.expensesList[index],
                    );
                  },
                  itemCount: AppLists.expeseList.length,
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            // elevation: 10,
            backgroundColor: AppColors.whitecolor,
            context: context,
            builder: (context) {
              return Consumer<HomeController>(
                builder: (context, controller, _) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Item Name",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        modalBottomSheetTextfield(
                            controller: controller.titleController),
                        Spacing.heightBox(20),
                        Text(
                          "Amount",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        modalBottomSheetTextfield(
                            controller: controller.priceController),
                        Spacing.heightBox(20),
                        Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            disabledBorder: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.orangeColor)),
                            border: UnderlineInputBorder(),
                          ),
                          hint: Text(controller.selectedCategory),
                          items: AppLists.categoryList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.updateCategory = value;
                          },
                        ),
                        Spacing.heightBox(20),
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        TextFormField(
                          controller: controller.dateController,
                          onTap: () {
                            controller.selectDate(context);
                          },
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.calendar_month),
                            hintStyle: TextStyle(fontSize: 12.sp),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.orangeColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.textColor),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.textColor),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.redColor),
                            ),
                          ),
                        ),
                        Spacing.heightBox(10),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              controller.addExpense();
                              context.pop();
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                  fontSize: 18.sp, fontFamily: Typo.semiBold),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}
