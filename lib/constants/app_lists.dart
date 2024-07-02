import 'package:flutter/material.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/models/expense_data_model.dart';

class AppLists {
  static List<String> categoryList = [
    "Food",
    "Bill",
    "Shopping",
    "Entertainment",
  ];
  static List<Color> categoryColorList = [
    AppColors.orangeColor,
    AppColors.voiletColor,
    AppColors.yellowColor,
    AppColors.greenColor,
  ];

  static List<ExpenseDataModel> expeseList = [
    ExpenseDataModel(
        title: "Grocery",
        category: "Shopping",
        amount: "120",
        date: DateTime(2023, 6, 1)),
    ExpenseDataModel(
        title: "House Rent",
        category: "Bill",
        amount: "120",
        date: DateTime.now()),
    ExpenseDataModel(
        title: "Film",
        category: "Entertainment",
        amount: "120",
        date: DateTime(2023, 4, 1)),
    ExpenseDataModel(
        title: "Video game",
        category: "Entertainment",
        amount: "120",
        date: DateTime(2023, 4, 1)),
  ];

  static List iconExpenseList = [
    Icons.food_bank,
    Icons.house,
    Icons.shopping_bag,
    Icons.movie
  ];
}
