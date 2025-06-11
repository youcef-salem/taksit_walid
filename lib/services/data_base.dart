import 'package:sqflite/sqflite.dart';

class dataBase_products {

 
  Future<Database> openbase_product()async  {
  var db = await openDatabase('products.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productName TEXT,
            productPrice REAL,          
            buy_Price REAL,
            productDescription TEXT,
          )
        ''');
    });
    

    return db;
  }
  Future<void> insertProduct(Database db, Map<String, dynamic> product) async {
    await db.insert('products', product);
  }
  Future<List<Map<String, dynamic>>> getProducts(Database db) async {
    return await db.query('products');
  }
  Future<void> updateProduct(Database db, int id, Map<String, dynamic> product) async {
    await db.update('products', product, where: 'id = ?', whereArgs: [id]);
  }
  Future<void> deleteProduct(Database db, int id) async {
    await db.delete('products', where: 'id = ?', whereArgs: [id]);
    
  }
  Future<void> closeDatabase( Database db) async {
   await db.close();
  }






}