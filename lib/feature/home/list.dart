// ignore: file_name

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projectwithsqllite/core/Model/StudentModel.dart';
import 'package:projectwithsqllite/core/cubit/student_cubit.dart';

import 'package:projectwithsqllite/core/helper/extensions.dart';
import 'package:projectwithsqllite/feature/view/edit_Page.dart';

import '../../core/routing/route.dart';

// ignore: camel_case_types
class listViewBuilder extends StatefulWidget {
  const listViewBuilder({super.key});

  @override
  State<listViewBuilder> createState() => _listViewBuilderState();
}

late List<StudentModel> allStudents;

// ignore: camel_case_types
class _listViewBuilderState extends State<listViewBuilder> {
  @override
  void initState() {
    super.initState();

    // BlocProvider.of<StudentCubit>(context).GetAllDataApi();
  }

  Widget build_Students_list(BuildContext context) {
    var bloc = context.read<StudentCubit>();
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        // height: 400.h,
        // width: 400.w,
        child: ListView.builder(
            itemCount: allStudents.length,
            itemBuilder: (context, index) {
              final student = allStudents[index];
              return Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  //style: ListTileStyle.drawer,
                  title: Text(
                    "Name: ${student.name}",
                    style: const TextStyle(color: Colors.black),
                  ),

                  leading: const Icon(
                    Icons.account_circle,
                  ),
                  // trailing: const Icon(Icons.edit),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showBottomSheet(
                                context: context,
                                builder: (context) => EditPage(
                                      student: student,
                                    ),
                                backgroundColor: Color(0xFF473E3B),
                                sheetAnimationStyle:
                                    AnimationStyle(curve: Curves.easeInCirc));
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Delete Item'),
                              icon: const Icon(
                                Icons.dangerous,
                                color: Colors.red,
                              ),
                              content: const Text(
                                  'Are you sure you want to delete this Item..?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    final id = student.id;
                                    bloc.rawDelete(id as int);
                                    context.pop();
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                    // bloc.GetAllData();
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ],
                  ),
                  subtitle: Text("Age:${student.age}"),
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "List View.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 71, 62, 59),
            ),
            body: _build_Cubit_State(context));
      },
    );
  }
}

Widget _build_Cubit_State(BuildContext context) {
  return BlocConsumer<StudentCubit, StudentState>(
    listener: (context, state) {
      if (state is Error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Accourding Error:"),
          backgroundColor: Color.fromARGB(255, 255, 36, 36),
        ));
        context.pop();
      }
      if (state is updataData) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Done Update",
              style: TextStyle(
                color: Colors.black,
              )),
          backgroundColor: Color(0xFF02F112),
        ));
        context.pop();
      }
      if (state is Submited) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Done Submiting",
              style: TextStyle(
                color: Colors.black,
              )),
          backgroundColor: Color.fromARGB(255, 2, 241, 18),
        ));
        context.pushNamed(Routes.home);
      }
      if (state is Deleted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Done delet:",
              style: TextStyle(
                color: Colors.black,
              )),
          backgroundColor: Color.fromARGB(255, 2, 241, 18),
        ));
      }

      if (state is Error) {
        String errermsg = state.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errermsg),
          backgroundColor: Colors.black,
        ));
      }
    },

    
    builder: (context, state) {
      if (state is StudentLoading) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Loading...",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ],
          ),
        );
      }

      if (state is StudentLoaded) {
        allStudents = (state).studentItem;
        return build_Students_list(
          context,
        );
        // context.pushNamed(Routes.homeScreen);
      }

      return Container();
    },
  );
}

Widget build_Students_list(BuildContext context) {
  var bloc = context.read<StudentCubit>();
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: SizedBox(
      // height: 400.h,
      // width: 400.w,
      child: ListView.builder(
          itemCount: allStudents.length,
          itemBuilder: (context, index) {
            final student = allStudents[index];
            return Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(10),
              child: ListTile(
                //style: ListTileStyle.drawer,
                title: Text(
                  "Name: ${student.name}",
                  style: const TextStyle(color: Colors.black),
                ),

                leading: const Icon(
                  Icons.account_circle,
                ),
                // trailing: const Icon(Icons.edit),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          showBottomSheet(
                              context: context,
                              builder: (context) => EditPage(
                                    student: student,
                                  ),
                              backgroundColor: Color(0xFF473E3B),
                              sheetAnimationStyle:
                                  AnimationStyle(curve: Curves.easeInCirc));
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Delete Item'),
                            icon: const Icon(
                              Icons.dangerous,
                              color: Colors.red,
                            ),
                            content: const Text(
                                'Are you sure you want to delete this Item..?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  final id = student.id;
                                  bloc.rawDelete(id as int);
                                  context.pop();
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                  // bloc.GetAllData();
                                },
                                child: const Text('No'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ],
                ),
                subtitle: Text("Age:${student.age}"),
              ),
            );
          }),
    ),
  );
}
