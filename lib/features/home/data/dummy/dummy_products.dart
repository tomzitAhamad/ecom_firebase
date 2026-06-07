import '../models/product_model.dart';

final List<ProductModel> topProducts = [
  ProductModel(
    name: "Leather Shoes",
    price: 149.99,
    description: "Premium leather shoes for daily use.",
    images: [
      "https://picsum.photos/500?1",
      "https://picsum.photos/500?2",
      "https://picsum.photos/500?3",
    ],
  ),

  ProductModel(
    name: "Apple Watch",
    price: 199.99,
    description: "Smart watch with premium features.",
    images: [
      "https://picsum.photos/500?4",
      "https://picsum.photos/500?5",
      "https://picsum.photos/500?6",
    ],
  ),
];

final List<ProductModel> accessories = [
  ProductModel(
    name: "Headphone",
    price: 89.99,
    description: "Noise cancelling headphone.",
    images: [
      "https://picsum.photos/500?7",
      "https://picsum.photos/500?8",
      "https://picsum.photos/500?9",
    ],
  ),
];
