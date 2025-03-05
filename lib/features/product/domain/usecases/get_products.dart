import 'package:flutter_application_1/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_application_1/features/product/domain/entities/product.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts({required this.repository});
  Future<List<ProductEntity>> call() async {
    final productModels = await repository.getProducts();
    return productModels.map((productModel) => productModel.toEntity()).toList();
  }
}
