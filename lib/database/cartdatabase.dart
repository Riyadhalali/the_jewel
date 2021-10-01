import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:the_jewel/models/cart_attr.dart';

class CartDataBase with ChangeNotifier {
  CartDataBase() {
    initDB();
  }

  // init the database
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'Cart_db.db'),
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE CART(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          productId TEXT,
          productTitle TEXT,
          productQuantity INT,
          productPrice REAL,
          productImage TEXT)
          
        ''');
      },
      version: 1,
    );
  }

  // insert data into database
  Future<bool> insertData(CartAttr data) async {
    final Database db = await initDB();
    db.insert("Cart_db", data.toMap());
    return true;
  }

  // get data from database
  Future<List<Map<String, dynamic>>> getData() async {
    final Database db = await initDB();
    return await db.query("Cart_db");
  }

  // update data in the database
  Future<void> update(CartAttr dataModel, String productId) async {
    final Database db = await initDB();
    await db.update("Cart_db", dataModel.toMap(), where: "productId=?", whereArgs: [productId]);
  }

  // delete data in database
  Future<void> delete(String productId) async {
    final Database db = await initDB();
    await db.delete("Cart_db", where: "productId=?", whereArgs: [productId]);
  }
} // end class
