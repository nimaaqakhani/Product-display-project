import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StudentListScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  StudentListScreen({super.key});
  void _addStudent(Box<Student> studentBox) {
    final name = _nameController.text;
    final lastName = _lastNameController.text;
    final age = int.tryParse(_ageController.text) ?? 0;

    if (name.isNotEmpty && lastName.isNotEmpty && age > 0) {
      final newStudent = Student(
        id: studentBox.length + 1,
        name: name,
        lastName: lastName,
        age: age,
      );
      studentBox.add(newStudent);
      _nameController.clear();
      _lastNameController.clear();
      _ageController.clear();
    }
  }

  void _editStudent(Box<Student> studentBox, int index, String newName,
      String newLastName, int newAge) {
    final student = studentBox.getAt(index);
    if (student != null) {
      student.name = newName;
      student.lastName = newLastName;
      student.age = newAge;
      studentBox.putAt(index, student); // بروزرسانی دانش‌آموز
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لیست دانش‌آموزان'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // فرم اضافه کردن دانش‌آموز
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'نام', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                      labelText: 'نام خانوادگی', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'سن', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      _addStudent(Hive.box<Student>('studentsBox')),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: Colors.green,
                  ),
                  child: const Text('ذخیره', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
          // لیست دانش‌آموزان
          Expanded(
            child: ValueListenableBuilder<Box<Student>>(
              valueListenable: Hive.box<Student>('studentsBox').listenable(),
              builder: (context, box, _) {
                final students = box.values.toList().cast<Student>();
                return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    final editNameController =
                        TextEditingController(text: student.name);
                    final editLastNameController =
                        TextEditingController(text: student.lastName);
                    final editAgeController =
                        TextEditingController(text: student.age.toString());

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      elevation: 4,
                      child: ListTile(
                        title: Text('${student.name} ${student.lastName}',
                            style: const TextStyle(fontSize: 18)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID: ${student.id}',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            Text('سن: ${student.age}',
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    'ویرایش دانش‌آموز (ID: ${student.id})'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: editNameController,
                                      decoration: const InputDecoration(
                                          labelText: 'نام',
                                          border: OutlineInputBorder()),
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: editLastNameController,
                                      decoration: const InputDecoration(
                                          labelText: 'نام خانوادگی',
                                          border: OutlineInputBorder()),
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: editAgeController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: 'سن',
                                          border: OutlineInputBorder()),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        final newName = editNameController.text;
                                        final newLastName =
                                            editLastNameController.text;
                                        final newAge = int.tryParse(
                                                editAgeController.text) ??
                                            0;
                                        if (newName.isNotEmpty &&
                                            newLastName.isNotEmpty &&
                                            newAge > 0) {
                                          _editStudent(box, index, newName,
                                              newLastName, newAge);
                                          Navigator.pop(context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(double.infinity, 50),
                                        primary: Colors.blue,
                                      ),
                                      child: Text('ذخیره',
                                          style: TextStyle(fontSize: 18)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
