// lib/screens/edit_task_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectwithsqllite/core/Model/StudentModel.dart';
import 'package:projectwithsqllite/core/cubit/student_cubit.dart';

import 'package:projectwithsqllite/core/helper/extensions.dart';

class EditTaskScreen extends StatefulWidget {
  final StudentModel student;

  const EditTaskScreen({super.key, required this.student});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  void initState() {
    super.initState();

   // BlocProvider.of<StudentCubit>(context).GetAllData();
  }

  @override
  void dispose() {
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final idController =
        TextEditingController(text: widget.student.id.toString());
    final titleController = TextEditingController(text: widget.student.name);
    final ageController =
        TextEditingController(text: widget.student.age.toString());
    var bloc = context.read<StudentCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Student.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF473E3B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              enabled: false,
              controller: idController,
              decoration: const InputDecoration(labelText: 'Number'),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final id = int.parse(idController.text);
                // Map<String, dynamic> valuse = {
                //   'Name': titleController.text,
                //   'Age': ageController.text,
                // };
                var obj = StudentModel(
                          id: id,
                          name: titleController.text,
                          age: int.parse(ageController.text));
                    bloc.updateStudentToApi(obj);
                // bloc.GetAllData();
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Done Update"),
                  backgroundColor: Color.fromARGB(135, 70, 118, 241),
                ));
                context.pop();
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
