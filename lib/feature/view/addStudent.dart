// lib/screens/edit_task_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectwithsqllite/core/cubit/student_cubit.dart';
import 'package:projectwithsqllite/core/helper/extensions.dart';
import 'package:projectwithsqllite/core/routing/route.dart';

import '../../core/Model/StudentModel.dart';

class Addstudent extends StatefulWidget {
  const Addstudent({
    super.key,
  });

  @override
  State<Addstudent> createState() => _AddstudentState();
}

class _AddstudentState extends State<Addstudent> {
  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerAge = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final idController = TextEditingController(text: student.id.toString());
    // final titleController = TextEditingController(text: student.name);
    // final ageController = TextEditingController(text: student.age.toString());

    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Add Student.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF473E3B),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: controllerName,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: Color.fromARGB(243, 210, 225, 231),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0 * 1.5, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter a valid  Phone";
                        } else if (value.length < 2) {
                          return "Too Short for a Phone Number";
                        }

                        return null;
                      },
                      onSaved: (value) {
                        controllerName.text = value!;
                      },
                    ),
                    /////////////////////////////
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerAge,
                      decoration: const InputDecoration(
                        focusColor: Colors.amber,
                        hintText: 'age',
                        filled: true,
                        fillColor: Color.fromARGB(243, 210, 225, 231),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0 * 1.5, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid  Age";
                        }
                        if (value.length > 2) {
                          return "Enter a valid  Age";
                        }
                        if (value.length > 2) {
                          return "Too Longe for a age Number";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Only Numbers are Allowed";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controllerAge.text = value!;
                      },
                    ),
                    const SizedBox(height: 20),

                    state is Submiting
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blueAccent,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                var obj = StudentModel(
                                    id: 0,
                                    name: controllerName.text,
                                    age: int.parse(controllerAge.text));
                                context
                                    .read<StudentCubit>()
                                    .submitStudentToApi(obj);
                                controllerName.text = "";
                                controllerAge.text = "";
                                //context.pushNamed(Routes.home);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor: Color(0xFF473E3B),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 50),
                              shape: const StadiumBorder(),
                            ),
                            child: const Text("Save"),
                          ),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
