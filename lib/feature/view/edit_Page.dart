import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/Model/StudentModel.dart';
import '../../core/cubit/student_cubit.dart';

class EditPage extends StatelessWidget {
  final StudentModel student;
  const EditPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController(text: student.id.toString());
    final titleController = TextEditingController(text: student.name);
    final ageController = TextEditingController(text: student.age.toString());
    var bloc = context.read<StudentCubit>();
    final formKey = GlobalKey<FormState>();

    return SizedBox(
      width: double.infinity,
      height: 370,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Edit..",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: AutofillHints.birthdayYear),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "  Name :",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontFamily: AutofillHints.birthdayYear),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    filled: true,
                    fillColor: Color.fromARGB(243, 214, 216, 216),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0 * 1.5, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a valid  Nwme";
                    } else if (value.length < 2) {
                      return "Enter a Longe Name";
                    }

                    return null;
                  }),
              const SizedBox(
                height: 6,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "  Age :",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontFamily: AutofillHints.birthdayYear),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    // hintText: 'Set a Age',
                    filled: true,
                    fillColor: Color.fromARGB(243, 214, 216, 216),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0 * 1.5, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a valid  Age";
                    }
                    if (value.length > 2) {
                      return "Too Longe for a age Number";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Only Numbers are Allowed";
                    }

                    return null;
                  }),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  enabledMouseCursor: MouseCursor.uncontrolled,
                  elevation: 5,
                  backgroundColor: Color.fromRGBO(241, 213, 5, 1),
                  foregroundColor: const Color.fromARGB(255, 12, 12, 12),
                  minimumSize: const Size(double.infinity, 50),
                  shape: const StadiumBorder(),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
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
                  }
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
