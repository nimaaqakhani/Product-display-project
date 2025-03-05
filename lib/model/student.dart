import 'package:hive/hive.dart';

part 'student.g.dart'; // این خط به صورت خودکار توسط build_runner تولید می‌شود

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  final int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String lastName;

  @HiveField(3) // اضافه کردن فیلد جدید
  int age;

  Student({
    required this.id,
    required this.name,
    required this.lastName,
    required this.age, // اضافه کردن فیلد جدید
  });
}