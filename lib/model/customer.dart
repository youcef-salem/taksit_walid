import 'dart:convert';

import 'package:taksit_walid/model/months_topay.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';
import 'package:intl/intl.dart';

class Customer {
  final int id;
  final String name;
  final String description;
  final int numerMonth;
  final String phone_number;
  final double monthlyPayment;
  final product sel_product;
  List<MonthsTopay> months_array = [];

  Customer({
    required this.sel_product,
    required this.id,
    required this.name,
    required this.phone_number,
    required this.numerMonth,
    required this.monthlyPayment,
    this.description = '',
    months_array ,
  });

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, description: $description, numerMonth: $numerMonth, phone_number: $phone_number, monthlyPayment: $monthlyPayment  ';
  }

  Map<String, dynamic> toMap() {
    final customer_map = <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'numerMonth': numerMonth,
      'phone_number': phone_number,
     
    };
    customer_map.addAll(sel_product.toMap());
    return customer_map;
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
     
      id: map['id'] is int ? map['id'] : int.parse(map['id'].toString()),
      name: map['name']?.toString() ?? '',
      description: map['description']?.toString() ?? '',
      numerMonth: map['numerMonth'] is int ? map['numerMonth'] : int.parse(map['numerMonth'].toString()),
      phone_number: map['phone_number']?.toString() ?? '',
      monthlyPayment: map['monthlyPayment'] == null ? 0.0 : (map['monthlyPayment'] is double ? map['monthlyPayment'] : double.parse(map['monthlyPayment'].toString())),
      sel_product: product.fromMap(map), // product fields come from the same map
     
    );
  }
  String serializeMonthsArray() {
    return jsonEncode(months_array.map((month) => month.toMap()).toList());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.numerMonth == numerMonth &&
        other.phone_number == phone_number &&
        other.monthlyPayment == monthlyPayment &&
        other.sel_product == sel_product;
  }

  void set_months(int id_customer) {
    for (var i = 1; i <= numerMonth; i++) {
      months_array.add(
        MonthsTopay(
          id_customer: id_customer,
          numner_of_pay: i,
          deadligne: DateFormat('dd-MM-yyyy').format(
            DateTime(
              DateTime.now().year,
              DateTime.now().month + i,
              DateTime.now().day,
            ),
          ),
          time_payment: null,
        ),
      );
    }
  }

  void paymonth(int number) {
    months_array[number].is_payed = true;
    months_array[number].time_payment = DateFormat('dd-MM-yyyy').format(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    );
  }

  void deletelast_month() {
    months_array.removeAt(0);
  }

  bool check_emty() {
    return months_array.isEmpty;
  }
}
