import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_mate/constants/app_lists.dart';
import 'package:money_mate/models/expense_data_model.dart';

class HomeController extends ChangeNotifier {
  String selectedCategory = "Bill";
  DateTime selectedDate = DateTime.now();
  List expensesList = AppLists.expeseList;
  bool isExpenseLoading = false;

  // texteditingcontrollers
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // setters
  set updateCategory(value) {
    selectedCategory = value;
    notifyListeners();
  }

  set updateExpenseLoading(value) {
    isExpenseLoading = value;
    notifyListeners();
  }

  set updateDate(value) {
    selectedDate = value;
    dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);

    notifyListeners();
  }

  // functions

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      updateDate = picked;
    }
  }

  clearTextEditingController() {
    titleController.clear();
    priceController.clear();
    selectedCategory = "";
    selectedDate = DateTime.now();
  }

  addExpense() {
    updateExpenseLoading = true;

    expensesList.add(
      ExpenseDataModel.fromJson({
        "title": titleController.text,
        "amount": priceController.text,
        "category": selectedCategory,
        "date": selectedDate,
      }),
    );
    updateExpenseLoading = false;

    clearTextEditingController();
    notifyListeners();
  }
}
