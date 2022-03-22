import 'dart:ffi';

class StockModel {
  late String nameCompany;
  late String numbers;
  late String price;
  late String labelCompany;
  late Float interest;

  StockModel(this.nameCompany, this.numbers, this.price, this.labelCompany , this.interest);
}