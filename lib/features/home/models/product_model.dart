class ProductModel {
  final int id;
  final String name;
  final String description;
  final String category;
  final double price;
  final String unit;
  final String imageUrl;
  final bool inStock;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.inStock,
  });
}
