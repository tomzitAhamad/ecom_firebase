import '../models/product_model.dart';

final List<ProductModel> allProducts = List.generate(
  20,
  (index) => ProductModel(
    name: "Product ${index + 1}",
    price: (index + 1) * 25.0,
    description: "This is product ${index + 1}",
    images: [
      "https://picsum.photos/300?random=${index + 1}",
      "https://picsum.photos/300?random=${index + 100}",
      "https://picsum.photos/300?random=${index + 200}",
    ],
  ),
);
