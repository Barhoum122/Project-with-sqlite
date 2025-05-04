// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projectwithsqllite/core/cubit/student_cubit.dart';
// import 'package:projectwithsqllite/feature/home/add_student.dart';

// class StudentPage extends StatefulWidget {
//   const StudentPage({Key? key}) : super(key: key);

//   @override
//   State<StudentPage> createState() => _StudentPageState();
// }

// class _StudentPageState extends State<StudentPage> {
//   var names = [];
//   int counter = 0;
//   var clr = Colors.yellow;
//   @override
//   Widget build(BuildContext context) {
//     var _bloc = context.read<StudentCubit>();
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.amber,
//           title: Text("Students"),
//           centerTitle: true,
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             var res = await showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     title: Text("Add Student"),
//                     content: AddStudentPage(),
//                     actionsAlignment: MainAxisAlignment.center,
//                     actions: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text("Cancel")),
//                     ],
//                   );
//                 });
//             setState(() {});
//           },
//           child: Icon(Icons.add),
//         ),
//         body: Column(
//           children: [
//             Text("data"),
//             Container(
//               color: Colors.amber,
//               height: 100,
//               width: 100,
//             )
//           ],
//         ));
//   }
// }
