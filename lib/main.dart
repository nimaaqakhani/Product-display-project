import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/product/presentation/bloc/product_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/product/presentation/screen/product_list_screen.dart';
import 'features/product/data/datasources/product_remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/usecases/get_products.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ProductBloc(
          getProducts: GetProducts(
            repository: ProductRepositoryImpl(
              remoteDataSource: ProductRemoteDataSource(), // ✅ مقداردهی به remoteDataSource
            ),
          ),
        )..add(FetchProductsEvent()), // ✅ اضافه کردن رویداد
        child: const ProductListScreen(),
      ),
    );
  }
}
