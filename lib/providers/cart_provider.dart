import 'package:flutter/material.dart';
import 'package:pos/model/cart_item.dart';

import '../constant/constants.dart';

class CartProvider with ChangeNotifier {
  final ValueNotifier<Map<String, Color>> placeOrderBtn = ValueNotifier({
    'background': grayColor,
    'text': textHeadingColor,
  });

  final ValueNotifier<String> selectedButton = ValueNotifier<String>('None');

  Map<String, CartItem> _items = {};

  // Get all cart items
  Map<String, CartItem> get items {
    return {..._items}; // Return a copy to prevent direct modification
  }

  // Get the total number of items in the cart
  int get itemCount {
    return _items.length;
  }

  // Get the total price of the cart
  double get totalPrice {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // Add an item to the cart
  void addItem(String productId, String productName, double price) {
    if (_items.containsKey(productId)) {
      // If item already exists, increase quantity
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          productName: existingCartItem.productName,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // Add new item to the cart
      _items.putIfAbsent(
        productId,
            () => CartItem(
          id: productId,
          productName: productName,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  // Clear the cart
  void clearCart() {
    _items = {};
    notifyListeners();
  }

  // Update item quantity
  void updateItemQuantity(String productId, int newQuantity) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          productName: existingCartItem.productName,
          price: existingCartItem.price,
          quantity: newQuantity,
        ),
      );
      notifyListeners();
    }
  }
}
