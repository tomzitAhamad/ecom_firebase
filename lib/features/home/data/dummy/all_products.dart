import '../models/product_model.dart';

final List<ProductModel> allProducts = List.generate(
  20,
  (index) => ProductModel(
    name: "Product ${index + 1}",
    image: "https://picsum.photos/300?random=$index",
    price: (index + 1) * 25.0,
  ),
);
