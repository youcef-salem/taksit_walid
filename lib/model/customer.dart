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
  final first_month = DateFormat('dd-MM-yyyy').format(DateTime.now());
  final next_month = DateFormat('dd-MM-yyyy').format(
    DateTime(DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
  );
  Customer({
    required this.sel_product,
    required this.id,
    required this.name,
    required this.phone_number,

    required this.numerMonth,
    required this.monthlyPayment,
    this.description = '',
  });

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, description: $description, numerMonth: $numerMonth, phone_number: $phone_number, monthlyPayment: $monthlyPayment  ';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'numerMonth': numerMonth,
      'phone_number': phone_number,
      'monthlyPayment': monthlyPayment,
      'product ': sel_product,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      sel_product: map['product'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      numerMonth: map['numerMonth']?.toInt() ?? 0,
      phone_number: map['phone_number']?.toInt() ?? 0,
      monthlyPayment: map['monthlyPayment']?.toDouble() ?? 0.0,
    );
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

  void set_months() {
    for (var i = 1; i <= numerMonth; i++) {
      months_array.add(
        MonthsTopay(
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
    months_array!.removeAt(0);
  }

  bool check_emty() {
    return months_array.isEmpty;
  }
}
