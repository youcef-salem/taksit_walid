import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';
import 'package:taksit_walid/services/data_base.dart';

class ProductList with ChangeNotifier {
  
  final List<product> products = [];
  late Database database;
  // Instance of the database handler
  final dataBase_products dataBaseProducts = dataBase_products();
  ProductList() {
    _initializeDatabase();
    notifyListeners();
  }

  Future<void> _initializeDatabase() async {
    database = await dataBaseProducts.openbase_product();
    await _loadProducts();
    notifyListeners();
  }

  Future<void> _loadProducts() async {
    final productList = await dataBaseProducts.getProducts(database);
    products.clear();
    for (var item in productList) {
      products.add(
        product(
          productName: item['productName'] as String,
          productPrice: item['productPrice'] as double,
          buy_Price: item['buy_Price'] as double,
          productDescription: item['productDescription'] as String,
        ),
      );
    }
    notifyListeners();
  }

  Future<void> addProduct(product newProduct) async {
    await dataBaseProducts.insertProduct(database, newProduct.toMap());
    products.add(newProduct);
    notifyListeners();
  }

  Future<void> updateProduct(int index, product updatedProduct) async {
    await dataBaseProducts.updateProduct(
      database,
      index,
      updatedProduct.toMap(),
    );
    products[index] = updatedProduct;
    notifyListeners();
  }

  Future<void> deleteProduct(int index) async {
    await dataBaseProducts.deleteProduct(database, index);
    products.removeAt(index);
    notifyListeners();
  }

  Future<void> closeDatabase() async {
    await dataBaseProducts.closeDatabase(database);
    notifyListeners();
  }
}
