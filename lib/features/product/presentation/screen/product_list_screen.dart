import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/product/data/models/product_model.dart';
import 'package:flutter_application_1/features/product/presentation/screen/product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'لیست محصولات',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: ProductModel.fakeProducts().length,
        itemBuilder: (context, index) {
          final product = ProductModel.fakeProducts()[index];
          return GestureDetector(
            onTap: () {
              // ارسال محصول به صفحه جزئیات
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.shade100,
                    Colors.deepPurple.shade50,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                        itemCount: product.images.length,
                        itemBuilder: (context, imageIndex) {
                          return Image.network(
                            product.images[imageIndex],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.price,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                         Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
