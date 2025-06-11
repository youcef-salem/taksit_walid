import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class dataBase_products {
  Future<Database> openbase_product() async {
    try {
      var db = await openDatabase(
        'products.db',
        version: 1,
        onCreate: (Database db, int version) async {
          debugPrint('Creating database...');
          
          await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productName TEXT,
            productPrice REAL,          
            buy_Price REAL,
            productDescription TEXT
          )
        ''');
          debugPrint('Database created successfully');
        },
        onOpen: (db) {
          debugPrint('Database opened');
        },
      );
      return db;
    } catch (e) {
      debugPrint('Error opening database: $e');
      rethrow;
    }
  }

  Future<void> insertProduct(Database db, Map<String, dynamic> product) async {
    await db.insert('products', product);
    
  }

  Future<List<Map<String, dynamic>>> getProducts(Database db) async {
    return await db.query('products');
  }

  Future<void> updateProduct(
    Database db,
    int id,
    Map<String, dynamic> product,
  ) async {
    await db.update('products', product, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteProduct(Database db, int id) async {
    await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> closeDatabase(Database db) async {
    await db.close();
  }
}
