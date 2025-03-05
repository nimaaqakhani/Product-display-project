import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/product/domain/entities/product.dart'; // وارد کردن ProductEntity

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String imageUrl = product.images.isNotEmpty ? product.images[0] : '';
    return Card(
      child: ListTile( 
        title: Text(product.title),
        subtitle: Text(product.price),
        trailing: imageUrl.isNotEmpty
            ? Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover)
            : const Icon(Icons
                .image_not_supported), // نمایش آیکون پیش‌فرض در صورت عدم وجود تصویر
      ),
    );
  }
}
