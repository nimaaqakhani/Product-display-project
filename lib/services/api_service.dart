import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/product_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl =
      "https://run.mocky.io/v3/cd32cb60-a99e-4ad1-bba0-a689a378b0f2";

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(_baseUrl);

      if (response.statusCode == 200) {
        if (response.data is List) {
          return (response.data as List)
              .map((item) => Product.fromJson(item))
              .toList();
        } else {
          throw const FormatException("Invalid response format");
        }
      } else {
        throw Exception("Failed to load products: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      print("Error fetching products: ${e.message}");
      rethrow;
    }
  }
}
