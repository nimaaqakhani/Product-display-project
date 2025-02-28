import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs; // لیست تمام محصولات (فیک + API)
  var isLoading = true.obs; // برای نمایش loading indicator
  final ApiService _apiService = ApiService(); // ایجاد نمونه از ApiService

  @override
  void onInit() {
    super.onInit();
    fetchAndCombineProducts(); // دریافت و ترکیب محصولات
  }

  /// دریافت و ترکیب محصولات فیک و API
  Future<void> fetchAndCombineProducts() async {
    try {
      isLoading(true); 
      List<Product> fakeProducts = Product.fakeProducts();
      // دریافت محصولات از API
      List<Product> apiProducts = await _apiService.fetchProducts();
      // ترکیب دو لیست
      products.assignAll([...fakeProducts, ...apiProducts]);
    } catch (e) {
      Get.snackbar('Error', e.toString()); // نمایش خطا به کاربر
    } finally {
      isLoading(false); // loading رو غیرفعال کن
    }
  }
}