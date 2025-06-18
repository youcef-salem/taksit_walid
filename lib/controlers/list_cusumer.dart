import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer';
import 'package:taksit_walid/model/customer.dart';
import 'package:taksit_walid/model/months_topay.dart';
import 'package:taksit_walid/services/database_customer.dart';

class ListCusumer with ChangeNotifier {
  final CustomerDB clas_db = CustomerDB();
  late final Database db;
  List<Customer> lista = [];
  ListCusumer() {
    _initDB();

  }
  Future<void> setlist() async {
    lista = await get_customer_list();
    notifyListeners();
  }

  Future<void> _initDB() async {
    db = await clas_db.openDB();
    log('Database opened successfully.');
    notifyListeners();
  }

  void add_customer(Customer sc) {
    clas_db.insertCustomer(db, sc.toMap());
    print('Inserted customer with id: ${sc.id}');
    for (var i = 0; i < sc.months_array.length; i++) {
      clas_db.insertMonthlyPayment(db, sc.id, sc.months_array[i].toMap());
      print('Inserted monthly payment ${i + 1} for customer with id: ${sc.id}');
    }
    notifyListeners();
  }

  Future<List<Customer>> get_customer_list() async {
    List<Customer> list_cutomer = [];
    List<Map<String, dynamic>> list_map = await clas_db.getCustomers(db);
    print('Retrieved ${list_map.length} customers from database.');
    for (var i = 0; i < list_map.length; i++) {
      Customer curent = Customer.fromMap(list_map[i]);
      List<Map<String, dynamic>> monthlyPaymentsMap = await clas_db
          .getMonthlyPayments(db, curent.id);
      curent.months_array = monthlyPaymentsMap
          .map((e) => MonthsTopay.fromMap(e))
          .toList();

      print(
        'Processed customer with id: ${curent.id} and ${curent.months_array.length} monthly payments.',
      );
      list_cutomer.add(curent);
    }
    return list_cutomer;
  }
}
