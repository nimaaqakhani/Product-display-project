// lib/features/product/domain/entities/product.dart
class ProductEntity {
  final int id;
  final String title;
  final String price;
  final List<String> images;
  final String description;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.description,
  });
}
