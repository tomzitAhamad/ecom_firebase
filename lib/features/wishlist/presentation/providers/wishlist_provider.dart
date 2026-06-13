import 'package:ecom_firebase/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  final List<ProductModel> _wishlistItems = [];

  List<ProductModel> get wishlistItems => _wishlistItems;

  void addToWishlist(ProductModel product) {
    final exists = _wishlistItems.any((item) => item.name == product.name);

    if (!exists) {
      _wishlistItems.add(product);
      notifyListeners();
    }
  }

  void removeFromWishlist(ProductModel product) {
    _wishlistItems.remove(product);
    notifyListeners();
  }
}
