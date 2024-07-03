import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class HomeController extends ChangeNotifier {
  String selectedCategory = "Bill";
  DateTime selectedDate = DateTime.now();
  List expensesList = [];
  String totalExpenseSpend = "0";
  var myBox = Hive.box("ExpenseBox");

  // texteditingcontrollers
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // setters
  set updateCategory(value) {
    selectedCategory = value;
    notifyListeners();
  }

  set updateTotalExpenseSpend(value) {
    totalExpenseSpend = value;
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
    dateController.clear();
  }

  addExpense(data) async {
    await myBox.add(data);
    print(myBox.values);
    getAllExpense();
    clearTextEditingController();
    notifyListeners();
  }

  getAllExpense() async {
    expensesList = await myBox.keys.map((e) {
      var res = myBox.get(e);

      return {
        'key': e,
        'title': res['title'],
        'category': res['category'],
        'price': res['price'],
        'date': res['date'],
      };
    }).toList();

    notifyListeners();
  }

  Future<void> deleteExpense(key) async {
    await myBox.delete(key);
    getAllExpense();
  }

  Future<void> updateItem(key, updateData) async {
    await myBox.put(key, updateData);
    HomeController().getAllExpense();
    clearTextEditingController();
    notifyListeners();
  }
}
