import 'package:flutter_application_1/features/product/domain/entities/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/product/domain/usecases/get_products.dart';
import 'package:flutter_application_1/features/product/data/models/product_model.dart'; // ✅ ایمپورت مدل
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final List<ProductEntity> productEntities = await getProducts(); 
        final List<ProductModel> products = productEntities
            .map((entity) => ProductModel(
                  id: entity.id,
                  title: entity.title,
                  description: entity.description,
                  price: entity.price,
                  images: entity.images,
                ))
            .toList();

        emit(ProductLoaded(products: products)); // 📌 حالا مقداردهی درست است ✅
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
