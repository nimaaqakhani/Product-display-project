// lib/features/product/data/models/product_model.dart
import 'package:flutter_application_1/features/product/domain/entities/product.dart';

class ProductModel {
  final int id;
  final String title;
  final String price;
  final List<String> images;
  final String description;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.description,
  });

  // تبدیل مدل به ProductEntity
  ProductEntity toEntity() {
    return ProductEntity(
      id: this.id,
      title: this.title,
      price: this.price,
      images: this.images,
      description: this.description,
    );
  }

  // سازنده از JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      images: List<String>.from(json['images']),
      description: json['description'],
    );
  }

  // سازنده برای محصولات فیک
  static List<ProductModel> fakeProducts() {
    return [
      ProductModel(
        id: 1,
        title: "گوشی سامسونگ A52",
        price: "12,000,000 تومان",
        images: [
          "https://i.postimg.cc/jqGtMWgS/652d03208716201626d081c2.jpg",
          "https://i.postimg.cc/g0Bfr512/download.jpg",
        ],
        description:
            "گوشی سامسونگ A52 با صفحه نمایش 6.5 اینچی، حافظه 128 گیگ و باتری 4500 میلی‌آمپری.",
      ),
      ProductModel(
        id: 2,
        title: "لپ‌تاپ لنوو مدل IdeaPad",
        price: "18,500,000 تومان",
        images: [
          "https://i.postimg.cc/LsT0ZW71/download-1.jpg",
          "https://i.postimg.cc/fT92vypZ/images.jpg",
        ],
        description:
            "لپ‌تاپ لنوو با پردازنده Core i5، رم 8 گیگابایت و صفحه نمایش Full HD.",
      ),
      ProductModel(
        id: 3,
        title: "هدفون بی‌سیم Sony WH-1000XM4",
        price: "9,800,000 تومان",
        images: [
          "https://i.postimg.cc/QMxvSscb/head1.jpg",
          "https://i.postimg.cc/1RN2vvVL/head2.jpg",
        ],
        description:
            "هدفون سونی WH-1000XM4 با کیفیت صدای عالی و نویز کنسلینگ فوق‌العاده.",
      ),
    ];
  }
}
