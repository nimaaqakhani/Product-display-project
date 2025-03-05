import 'package:dio/dio.dart';
import 'package:flutter_application_1/features/product/data/models/product_model.dart';
// 
class ProductRemoteDataSource {
  final Dio _dio = Dio();
  final String _baseUrl =
      "https://run.mocky.io/v3/cd32cb60-a99e-4ad1-bba0-a689a378b0f2";
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        if (response.data is List) {
          return (response.data as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
        } else {
          throw const FormatException("Expected a list in the response.");
        }
      } else {
        throw Exception("Failed to load products: ${response.statusCode}");
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          throw Exception(
              "Error fetching products: ${e.response?.statusCode} - ${e.response?.data}");
        } else {
          throw Exception("Error fetching products: ${e.message}");
        }
      } else {
        throw Exception("Error fetching products: ${e.toString()}");
      }
    }
  }
}
