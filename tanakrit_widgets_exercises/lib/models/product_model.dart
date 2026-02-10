class ProductModel {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final double rating;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}
