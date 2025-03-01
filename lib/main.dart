import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/view/product_list_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'فلاتر دیوار',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => ProductBloc(ApiService())..add(FetchProductsEvent()),
        child: const ProductListScreen(),
      ),
    );
  }
}
