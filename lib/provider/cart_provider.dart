import 'package:flutter/material.dart';
import 'package:the_jewel/database/cartdatabase.dart';
import 'package:the_jewel/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  CartDataBase cartDataBase = CartDataBase();

  Map<String, CartAttr> _cartItems = {};

  List<CartAttr> _lst = [];

  List<CartAttr> get lst => [..._lst]; // to get all items in the cart

  //-> Get the Cart Attributes using Map methods
  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  // make instance of database

  CartProvider() {
    getDataList();
  }
  //-> add product to provider and database
  add(String productId, double price, String title, String imageUrl) {
    _lst.add(CartAttr(id: productId, title: title, quantity: 1, price: price, imageUrl: imageUrl));
    notifyListeners();
    cartDataBase.insertData(
        CartAttr(id: productId, title: title, quantity: 1, price: price, imageUrl: imageUrl));
  }

  /// old functions using provider
//----------------------Get total prices-------------------------
  //-> get the total prices for all items
  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  //----------------Add Product to Cart------------------------------using old way
  // void addProduct(String productId, double price, String title, String imageUrl) {
  //   // check if product already exists in cart update this product
  //   if (_cartItems.containsKey(productId)) {
  //     _cartItems.update(
  //         productId,
  //         (existingCartItem) => CartAttr(
  //             id: existingCartItem.id,
  //             title: existingCartItem.title,
  //             quantity: existingCartItem.quantity + 1, // because item already exists so add 1
  //             price: existingCartItem.price,
  //             imageUrl: existingCartItem.imageUrl));
  //
  //     // use update function in database
  //   } else {
  //     _cartItems.putIfAbsent(
  //         productId,
  //         () =>
  //             CartAttr(id: productId, title: title, quantity: 1, price: price, imageUrl: imageUrl));
  //   }
  //   // add product to cart model class and save it in the database
  //   cartDataBase.insertData(
  //       CartAttr(id: productId, title: title, quantity: 1, price: price, imageUrl: imageUrl));
  //   notifyListeners(); // Notify Listeners
  // }

//---------------------Remove Product from Cart --------------------------------
//   void reduceItemByOne(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//               id: existingCartItem.id,
//               title: existingCartItem.title,
//               quantity: existingCartItem.quantity - 1,
//               price: existingCartItem.price,
//               imageUrl: existingCartItem.imageUrl));
//     }
//     notifyListeners();
//   }

  //-----------------Add Item By One--------------------------------------------
  // void addItemByOne(String productId) {
  //   if (_cartItems.containsKey(productId)) {
  //     _cartItems.update(
  //         productId,
  //         (existingCartItem) => CartAttr(
  //             id: existingCartItem.id,
  //             title: existingCartItem.title,
  //             quantity: existingCartItem.quantity + 1,
  //             price: existingCartItem.price,
  //             imageUrl: existingCartItem.imageUrl));
  //   }
  //   notifyListeners();
  // }

  //------------------------Remove Item-----------------------------------------
  void removeItem(String productId) {
    _lst.remove(productId);
    notifyListeners();
  }

  //-------------------------------Clear Cart-----------------------------------
  void clearCart() {
    _lst.clear();
    notifyListeners();
  }

  //---------------------------Get Item Price-----------------------------------
  // double getItemPrice() {
  //   var itemPrice = 0.0;
  //   _cartItems.forEach((key, value) {
  //     itemPrice = value.price * value.quantity;
  //   });
  //   return itemPrice;
  // }

  //--------------------------------Database Functions--------------------------
  // Future<void> getData() async {
  //   // get the data stored in database
  //   ///  Map<String, CartAttr> _cartItems = {};
  //   ///  returned from api call : Future<List<Map<String, dynamic>>> => returned from database
  //   ///
  //   var dataList = await cartDataBase.getData();
  //
  //   _cartItems = dataList.map((item) => CartAttr(
  //           id: item["id"],
  //           title: item["title"],
  //           quantity: item["quantity"],
  //           price: item["price"],
  //           imageUrl: item["imageUrl"])
  //       .toMap()) as Map<String, CartAttr>;
  //
  //   notifyListeners();
  // }
  ///------------------the end of old functions using provider----------------------------------
  //--------------------------------Get Data----------------------------------
  Future<void> getDataList() async {
    final dataList = await cartDataBase.getData();
    _lst = dataList
        .map((item) => CartAttr(
            id: item["id"],
            title: item["title"],
            quantity: item["quantity"],
            price: item["price"],
            imageUrl: item["imageUrl"]))
        .toList();

    notifyListeners();
  }

  //---------------------Add Item to cart using provider and list-----------------------
  Future<void> addItemQuantity(String productId) async {
    for (int i = 0; i < _lst.length; i++) {
      if (_lst[i].id == productId) {
        _lst[i].quantity = _lst[i].quantity + 1;
        notifyListeners();
      }
    }
  }

  //---------------------Decrease Item by One using provider and list---------------------
  Future<void> reduceItemQuantity(String productId) async {
    for (int i = 0; i < _lst.length; i++) {
      if (_lst[i].id == productId) {
        _lst[i].quantity = _lst[i].quantity - 1;
        notifyListeners();
      }
    }
  }
} //---------------------------------End Class----------------------------------
//TODO: update specific row in sql
