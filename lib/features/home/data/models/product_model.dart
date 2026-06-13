class ProductModel {
  final String name;
  final List<String> images;
  final double price;
  final String description;
  int quantity;

  ProductModel({
    required this.name,
    required this.images,
    required this.price,
    required this.description,
    this.quantity = 1,
  });
}
