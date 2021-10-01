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
  void addProduct(String productId, double price, String title, String imageUrl) {
    // check if product already exists in cart update this product
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1, // because item already exists so add 1
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () =>
              CartAttr(id: productId, title: title, quantity: 1, price: price, imageUrl: imageUrl));
    }
    notifyListeners(); // Notify Listeners
  }

//---------------------Remove Product from Cart --------------------------------
  void reduceItemByOne(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
    }
    notifyListeners();
  }

  //-----------------Add Item By One--------------------------------------------
  void addItemByOne(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
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

  //---------------------------Get Item Price-----------------------------------
  double getItemPrice() {
    var itemPrice = 0.0;
    _cartItems.forEach((key, value) {
      itemPrice = value.price * value.quantity;
    });
    return itemPrice;
  }
  //--------------------------------Database Functions--------------------------

} //---------------------------------End Class----------------------------------
