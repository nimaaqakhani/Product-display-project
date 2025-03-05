import 'package:flutter_application_1/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_application_1/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_application_1/features/product/data/models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource}); // ✅ پارامتر اجباری

  @override
  Future<List<ProductModel>> getProducts() async {
    return await remoteDataSource.fetchProducts();
  }
}
