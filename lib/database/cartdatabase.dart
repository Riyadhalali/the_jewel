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
          sql_id INTEGER PRIMARY KEY,
          id TEXT ,
          title TEXT,
          quantity INT,
          price REAL,
          imageUrl TEXT)
          
        ''');
      },
      version: 1,
    );
  }

  // insert data into database
  Future<bool> insertData(CartAttr data) async {
    final Database db = await initDB();
    db.insert("CART", data.toMap());
    print('data added successfully to database');
    return true;
  }

  // get data from database
  Future<List<Map<String, dynamic>>> getData() async {
    final Database db = await initDB();
    // print(db.query("CART"));
    return await db.query("CART");
  }

  // update data in the database
  Future<void> update(CartAttr dataModel, String productId) async {
    final Database db = await initDB();
    await db.update("CART", dataModel.toMap(), where: "id=?", whereArgs: [productId]);
  }

  // delete data in database
  Future<void> delete(String productId) async {
    final Database db = await initDB();
    await db.delete("CART", where: "id=?", whereArgs: [productId]);
  }

  //Delete row in database
  Future<void> deleteRaw(String productId) async {
    final Database db = await initDB();
    db.rawDelete('''
      DELETE FROM CART
      WHERE id=?  
    ''', [productId]);
  }
} // end class
