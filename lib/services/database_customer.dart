import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taksit_walid/model/customer.dart';

class CustomerDB {
  /// Opens (or creates) the database and the needed tables.
  Future<Database> openDB() async {
    debugPrint('Attempting to open or create database...');
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'customer.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        debugPrint('Creating database tables...');
        await db.execute('''
          CREATE TABLE customers (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            numerMonth INTEGER,
            phone_number TEXT,
            monthlyPayment REAL,
            productName TEXT,
            buy_Price REAL,
            productPrice REAL,
            productDescription TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE monthly_payments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            customer_id INTEGER,
            deadligne TEXT,
            numner_of_pay INTEGER,
            time_payment TEXT,
            is_payed INTEGER DEFAULT 0,
            FOREIGN KEY (customer_id) REFERENCES customers (id)
          )
        ''');
        debugPrint('Database tables created successfully');
      },
      onOpen: (Database db) {
        debugPrint('Database opened');
      },
    );
  }

  Future<int> insertCustomer(Database db, Map<String, dynamic> customer) async {
    debugPrint('Inserting customer: $customer');
    int id = await db.insert('customers', customer);
    debugPrint('Inserted customer with id: $id');
    return id;
  }

  Future<int> insertMonthlyPayment(
    Database db,
    int customerId,
    Map<String, dynamic> payment,
  ) async {
    payment['customer_id'] = customerId;
    debugPrint(
      'Inserting monthly payment for customer id $customerId: $payment',
    );
    int id = await db.insert('monthly_payments', payment);
    debugPrint('Inserted monthly payment with id: $id');
    return id;
  }

  Future<List<Map<String, dynamic>>> getCustomers(Database db) async {
    debugPrint('Fetching all customers');
    List<Map<String, dynamic>> customers = await db.query('customers');
    debugPrint('Fetched ${customers.length} customers');
    return customers;
  }

  Future<List<Map<String, dynamic>>> getMonthlyPayments(
    Database db,
    int customerId,
  ) async {
    debugPrint('Fetching monthly payments for customer id: $customerId');
    List<Map<String, dynamic>> payments = await db.query(
      'monthly_payments',
      where: 'customer_id = ?',
      whereArgs: [customerId],
    );
    debugPrint(
      'Fetched ${payments.length} monthly payments for customer id: $customerId',
    );
    return payments;
  }

  Future<void> pay_month(Database db, Customer customer) async {
    await db.delete(
      'monthly_payments',
      where: 'customer_id = ? AND numner_of_pay=? ',
      whereArgs: [customer.id, customer.numerMonth],
    );
    await db.update('customers',
     {'numerMonth': customer.numerMonth==0 ? 0 : customer.numerMonth - 1}  ,
     where: 'id=?',
     whereArgs: [customer.id]
     
      );
  }

  Future<void> closeDB(Database db) async {
    debugPrint('Closing the database...');
    await db.close();
    debugPrint('Database closed');
  }
}
