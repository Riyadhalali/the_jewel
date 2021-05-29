import 'package:flutter/material.dart';
import 'package:the_jewel/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  //-> Get the Cart Attributes using Map methods
  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

//----------------------Get total prices-------------------------
  //-> get the total prices for all items
  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  //----------------Add Product to Cart------------------------------
  void addProduct(
      String productId, double price, String title, String imageUrl) {
    // check if product already exists in cart update this product
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
              existingCartItem.id,
              existingCartItem.title,
              existingCartItem.quantity +
                  1, // because item already exists so add 1
              existingCartItem.price,
              existingCartItem.imageUrl));
    } else {
      _cartItems.putIfAbsent(
          productId, () => CartAttr(productId, title, 1, price, imageUrl));
    }
    notifyListeners(); // Notify Listeners
  }

//---------------------Remove Product from Cart --------------------------------
  void reduceItemByOne(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
              existingCartItem.id,
              existingCartItem.title,
              existingCartItem.quantity - 1,
              existingCartItem.price,
              existingCartItem.imageUrl));
    }
    notifyListeners();
  }

  //-----------------Add Item By One--------------------------------------------
  void addItemByOne(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
              existingCartItem.id,
              existingCartItem.title,
              existingCartItem.quantity + 1,
              existingCartItem.price,
              existingCartItem.imageUrl));
    }
    notifyListeners();
  }

  //------------------------Remove Item-----------------------------------------
  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  //-------------------------------Clear Cart-----------------------------------
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
} //---------------------------------End Class----------------------------------
