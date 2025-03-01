import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:flutter_application_1/view/product_list_screen.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter()); // ثبت Adapter
  await Hive.openBox<Student>('studentsBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'فلاتر دیوار',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}
