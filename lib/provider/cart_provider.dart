import 'package:flutter/material.dart';
import 'package:the_jewel/database/cartdatabase.dart';
import 'package:the_jewel/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  CartDataBase cartDataBase = CartDataBase();

  // Map<String, CartAttr> _cartItems = {};

  List<CartAttr> _lst = [];

  List<CartAttr> get lst => [..._lst]; // to get all items in the cart

  //-> Get the Cart Attributes using Map methods
  // Map<String, CartAttr> get getCartItems {
  //   return {..._cartItems};
  // }

  // make instance of database
  CartProvider() {
    getDataList();
  }

  /// old functions using provider
//----------------------Get total prices-------------------------
  //-> get the total prices for all items
  // double get totalAmount {
  //   var total = 0.0;
  //   _cartItems.forEach((key, value) {
  //     total += value.price * value.quantity;
  //   });
  //   return total;
  // }

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
  Future<void> addItemQuantity(
      String productId, double productPrice, String productTitle, String productImageUrl) async {
    for (int i = 0; i < _lst.length; i++) {
      if (_lst[i].id == productId) {
        _lst[i].quantity = _lst[i].quantity + 1;
        await cartDataBase.update(
            CartAttr(
              id: productId,
              price: productPrice,
              quantity: _lst[i].quantity,
              title: productTitle,
              imageUrl: productImageUrl,
            ),
            productId);
        notifyListeners();
      }
    }
  }

  //---------------------Decrease Item by One using provider and list---------------------
  Future<void> reduceItemQuantity(
      String productId, double productPrice, String productTitle, String productImageUrl) async {
    for (int i = 0; i < _lst.length; i++) {
      if (_lst[i].id == productId) {
        _lst[i].quantity = _lst[i].quantity - 1;
        // update the database also
        await cartDataBase.update(
            CartAttr(
              id: productId,
              price: productPrice,
              quantity: _lst[i].quantity,
              title: productTitle,
              imageUrl: productImageUrl,
            ),
            productId);
        notifyListeners();
      }
    }
  }

  //------------------------Remove Item-----------------------------------------
  void removeItem(String productId) {
    int index;
    //we must use removeAt to remove the item from the list and we must get the index of the item
    ///Note: when delete the first item it will be as index of zero and as productId there isn't id at zero
    index = _lst.indexWhere(((lst) => lst.id == productId));
    _lst.removeAt(index);
    cartDataBase.deleteRaw(productId);
    notifyListeners();
  }

  //-------------------------------Clear Cart-----------------------------------
  void clearCart() {
    _lst.clear();
    notifyListeners();
  }

  //-> add product to provider and database
  add(String productId, double price, String title, String imageUrl) {
    // we must check first if the item already exists in cart if doesn't exists then add the item
    //  for (int i = 0; i < _lst.length; i++) {
    //  if (_lst[i].id == productId) {
    // return; // don't do anything
    // } else {
    //TODO: if product exits don't add it to the cart

    _lst.add(CartAttr(id: productId, title: title, quantity: 1, price: price, imageUrl: imageUrl));
    notifyListeners();
    cartDataBase.insertData(
        CartAttr(id: productId, title: title, quantity: 1, price: price, imageUrl: imageUrl));
    // }
    // }
  }

  //---------------------Get total price for all items in cart----------------------------
  double get getTotalPrice {
    double totalPrice = 0.0;
    for (int i = 0; i < _lst.length; i++) {
      totalPrice += (_lst[i].price) * _lst[i].quantity;
    }
    return totalPrice;
  }
} //---------------------------------End Class--------------------------------------------
// notesData.items.where((item) => item.category.contains(catId)).toList();
