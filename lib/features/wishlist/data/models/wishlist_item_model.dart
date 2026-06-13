import 'package:ecom_firebase/features/home/data/models/product_model.dart';

class WishlistItemModel {
  final ProductModel product;
  final int quantity;

  WishlistItemModel({required this.product, required this.quantity});

  double get totalPrice => product.price * quantity;
}
