// import 'package:flutter_application_1/model/product_model.dart';
// import 'package:flutter_application_1/services/api_service.dart';
// import 'package:get/get.dart';

// class ProductController extends GetxController {
//   var products = <Product>[].obs;
//   var isLoading = true.obs; 
//   final ApiService _apiService = ApiService();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAndCombineProducts();
//   }

//   Future<void> fetchAndCombineProducts() async {
//     try {
//       isLoading(true); 
//       List<Product> fakeProducts = Product.fakeProducts();
//       List<Product> apiProducts = await _apiService.fetchProducts();
//       products.assignAll([...fakeProducts, ...apiProducts]);
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }
// }