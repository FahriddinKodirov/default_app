import 'package:default_package/default/sql/database/sqlflite.dart';
import 'package:default_package/default/sql/model/student_model.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
                StudentModel studentModel =
                    StudentModel(age: 24, name: 'Abdulloh');

                LocalDatabase.insertStudent(studentModel: studentModel);
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                setState(() {});
                LocalDatabase.deleteAll();
              },
              icon: const Icon(Icons.delete_forever_outlined))
        ],
        title: const Text('Student'),
      ),
      body: FutureBuilder(
        future: LocalDatabase.getTaskByTitle(name: search.text),
        // LocalDatabase.getStudent() shu varyantda yozsa ham boldai, faqat search  bolmaydi
        builder: (context, AsyncSnapshot<List<StudentModel>> snapshot) {
          if (snapshot.data!.isEmpty) {
            return Center(
                child: Icon(
              Icons.file_copy_outlined,
              color: Colors.grey[200],
              size: 96,
            ));
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onEditingComplete: () => setState(() {}),
                  controller: search,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search',
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    StudentModel date = snapshot.data![index];
                    return ListTile(
                      leading: Column(
                        children: [
                          Text(date.age.toString()),
                          Text(date.name.toString()),
                        ],
                      ),
                      title: IconButton(
                          onPressed: () {
                            setState(() {});
                            var student = StudentModel(
                                id: date.id, age: 30, name: 'Muhammad');
                            LocalDatabase.updateTaskById(student);
                          },
                          icon: const Icon(Icons.edit)),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {});
                            LocalDatabase.deleteTaskById(date.id!);
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

