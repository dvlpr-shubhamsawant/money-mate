class ExpenseDataModel {
  String? title;
  String? category;
  String? amount;
  DateTime? date;

  ExpenseDataModel({this.title, this.category, this.amount, this.date});

  ExpenseDataModel.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["amount"] is int) {
      amount = json["amount"];
    }
    if (json["date"] is String) {
      date = json["date"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    _data["title"] = title;
    _data["category"] = category;
    _data["amount"] = amount;
    _data["date"] = date;
    return _data;
  }
}
