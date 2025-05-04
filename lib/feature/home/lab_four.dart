// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projectwithsqllite/core/Model/StudentModel.dart';
// import 'package:projectwithsqllite/core/cubit/student_cubit.dart';

// class Listvieww extends StatelessWidget {
//   const Listvieww({super.key, required this.student, });
//   final StudentModel student;
//   @override
//   //  List<StudentModel> allStudents;
//   Widget build(BuildContext context) {
//     return BlocBuilder<StudentCubit, StudentState>(
//       builder: (context, state) {
//         if(state )
//       return Container(
//         height: 200,
//         width: 200,
//         color: Color.fromARGB(255, 89, 89, 218),
//         child: ListView.builder(
//           itemCount: student.length,
//           itemBuilder: (context, index) {
//             final studentdata = student[index];
//             return Container(
//                 padding: const EdgeInsets.all(2),
//                 margin: const EdgeInsets.all(10),
//                 child: ListTile(
//                   //style: ListTileStyle.drawer,
//                   title: Text("xxxxxxxxxxxx${studentdata.name}"),
//                   leading: const CircleAvatar(
//                     radius: 50,
//                     foregroundColor: Colors.purple,
//                     backgroundColor: Colors.purple,
//                     child: CircleAvatar(
//                       //backgroundColor: Colors.red,

//                       /*child: Image.asset(
//                               "assets/images/11.png",
//                             height: 50,
//                             width: 50,
//                             fit: BoxFit.cover,
//                           ),*/
//                       backgroundImage: AssetImage("assets/images/11.png"),
//                       backgroundColor: Colors.teal,
//                       radius: 25,
//                     ),
//                   ),
//                   trailing: const Icon(Icons.settings),
//                   subtitle: Text("Age:${studentdata.age}"),
//                   // onTap: (){
//                   //   // clr = clr==Colors.lightBlue?Colors.yellow:Colors.lightBlue;
//                   //   // setState(() {

//                   //   });
//                   //print("========= ${names[index]} pressed ==========");
//                   // },
//                   // onLongPress: (){

//                   //   setState(() {
//                   //     clr = Colors.purple;
//                   //   }
//                 ));
//           },
//         ),
//       );
//     });
//   }
// }
