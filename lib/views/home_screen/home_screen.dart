import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/constants/app_lists.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/constants/spacing.dart';
import 'package:money_mate/constants/typography.dart';
import 'package:money_mate/controllers/home_controller.dart';
import 'package:money_mate/services/local_notifications.dart';
import 'package:money_mate/views/shared_widget/expense_card_widget.dart';
import 'package:money_mate/views/shared_widget/modal_bottom_sheet_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenToNotification();
  }

  // listen to any notifications clicked or not
  listenToNotification() {
    print("listening to notification");
    LocalNotifications.onClickNotification.stream.listen((event) {});
  }

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expenses",
          style: TextStyle(fontSize: 18.sp),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              size: 30.sp,
            ),
            onPressed: () {
              homeController.getAllExpense();
              LocalNotifications.showPeriodicNotification(
                title: "Money Mate",
                body: "App is Refresh",
                payload: "Periodic Notification",
              );
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        padding: Spacing.screenPadding,
        width: double.infinity,
        child: Consumer<HomeController>(builder: (context, controller, _) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: RefreshIndicator(
              onRefresh: () async {
                await homeController.getAllExpense();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.heightBox(30),

                  // list of expenses

                  // Expense list
                  controller.expensesList.isNotEmpty
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            print(controller.expensesList[0]['amount']);
                            return expenseShowCard(
                              ontap: () {
                                // context.goNamed(
                                //   ExpenseDetailScreen.id,
                                //   pathParameters: {
                                //     "key": controller.expensesList[index]['key']
                                //         .toString()
                                //   },
                                // );
                              },
                              delete: () async {
                                controller.deleteExpense(
                                  controller.expensesList[index]['key'],
                                );
                              },
                              update: () async {
                                // update expense
                                bottomSheet(
                                  context,
                                  buttonTitle: "UPDATE",
                                  onpress: () async {
                                    if (homeController
                                            .titleController.text.isNotEmpty &&
                                        homeController
                                            .selectedCategory.isNotEmpty &&
                                        homeController
                                            .priceController.text.isNotEmpty) {
                                      Map updateData = {
                                        "title":
                                            homeController.titleController.text,
                                        "category":
                                            homeController.selectedCategory,
                                        "price":
                                            homeController.priceController.text,
                                        "date": homeController.selectedDate,
                                      };
                                      await controller.updateItem(
                                        controller.expensesList[index]['key'],
                                        updateData,
                                      );

                                      context.pop();
                                    } else {
                                      context.pop();
                                    }
                                  },
                                );
                              },
                              title: controller.expensesList[index]['title'],
                              category: controller.expensesList[index]
                                  ['category'],
                              amount: controller.expensesList[index]['price'],
                              date: controller.expensesList[index]['date'],
                            );
                          },
                          itemCount: controller.expensesList.length,
                        )
                      : Text("No Expense found"),
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheet(
            context,
            buttonTitle: "ADD",
            onpress: () {
              Map data = {
                "title": homeController.titleController.text,
                "category": homeController.selectedCategory,
                "price": homeController.priceController.text,
                "date": homeController.selectedDate,
              };
              homeController.addExpense(data);

              context.pop();
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

  Future<dynamic> bottomSheet(BuildContext context,
      {color, buttonTitle, onpress}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      // elevation: 10,
      backgroundColor: AppColors.whitecolor,
      context: context,
      builder: (context) {
        return Consumer<HomeController>(
          builder: (context, controller, _) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                    controller: controller.priceController,
                  ),
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
                          borderSide: BorderSide(color: AppColors.orangeColor)),
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
                  ),
                  Spacing.heightBox(10),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(backgroundColor: color),
                      onPressed: onpress,
                      child: Text(
                        "${buttonTitle}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: Typo.semiBold,
                        ),
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
  }
}
