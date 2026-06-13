import 'package:ecom_firebase/features/cart/data/models/cart_item_model.dart';
import 'package:ecom_firebase/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;

  void addToCart(ProductModel product) {
    final index = _cartItems.indexWhere(
      (item) => item.product.name == product.name,
    );

    if (index >= 0) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItemModel(product: product));
    }

    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }

    return total;
  }
}
