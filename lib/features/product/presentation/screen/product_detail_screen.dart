import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/product/data/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  // سازنده برای دریافت محصول
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: SizedBox(
                    height: 300,
                    child: PageView.builder(
                      itemCount: product.images.length,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                          aspectRatio: 16 / 9, 
                          child: Image.network(
                            product.images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.price,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const Text(
                'ویژگی‌های محصول:',
                style: TextStyle(
                  
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              ..._buildFeatureList(),
              const SizedBox(height: 20),
              // دکمه‌های خرید
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'خرید محصول',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(color: Colors.deepPurple),
                      ),
                      child: const Text(
                        'افزودن به سبد خرید',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // تابعی برای نمایش ویژگی‌های محصول
  List<Widget> _buildFeatureList() {
    return [
      _buildFeatureItem('رنگ: مشکی'),
      _buildFeatureItem('وزن: ۲۰۰ گرم'),
      _buildFeatureItem('ابعاد: ۱۵x۱۰x۵ سانتی‌متر'),
      _buildFeatureItem('گارانتی: ۱۸ ماهه'),
    ];
  }

  // نمایش هر ویژگی به همراه آیکن تیک
  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade800,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(width: 8),
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
        ],
      ),
    );
  }
}
