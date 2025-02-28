import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:get/get.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final ApiService _apiService = ApiService();

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
      body: FutureBuilder<List<Product>>(
        future: _fetchCombinedProducts(), // آینده برای دریافت داده‌ها
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // نمایش بارگذاری در حال بارگذاری
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          } else if (snapshot.hasError) {
            // نمایش خطا در صورتی که درخواست با خطا مواجه شود
            return Center(
              child: Text('خطا: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // نمایش پیام در صورتی که داده‌ای وجود نداشته باشد
            return const Center(
              child: Text('محصولی پیدا نشد!'),
            );
          }
          // نمایش لیست محصولات
          List<Product> products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetailScreen(product: product));
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
                      // نمایش عکس‌ها به صورت اسلایدی
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
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
                      // نمایش تایتل و قیمت
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
                      // نمایش توضیحات
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
          );
        },
      ),
    );
  }

  /// تابع برای ترکیب داده‌های فیک و API
  Future<List<Product>> _fetchCombinedProducts() async {
    try {
      // دریافت محصولات فیک
      List<Product> fakeProducts = Product.fakeProducts();

      // دریافت محصولات از API
      List<Product> apiProducts = await _apiService.fetchProducts();

      // ترکیب دو لیست
      return [...fakeProducts, ...apiProducts];
    } catch (e) {
      throw Exception("Failed to load products: $e");
    }
  }
}
