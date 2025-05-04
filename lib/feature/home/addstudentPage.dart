// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:projectwithsqllite/core/Model/StudentModel.dart';
// import 'package:projectwithsqllite/core/cubit/student_cubit.dart';
// import 'package:projectwithsqllite/core/helper/extensions.dart';
// import 'package:projectwithsqllite/core/routing/route.dart';

// class AddStudent extends StatefulWidget {
//   const AddStudent({
//     super.key,
//   });

//   @override
//   State<AddStudent> createState() => _AddStudentState();
// }

// class _AddStudentState extends State<AddStudent> {
//   // late String phoneNumber;

//   final TextEditingController controllerName = TextEditingController();

//   final TextEditingController controllerAge = TextEditingController();

//   late List<StudentModel> allStudentss;

//   final _formKey = GlobalKey<FormState>();

//   // PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("view Student"),
//       ),
//       backgroundColor: Colors.white,
//       body: LogoWithTitle(
//         title: 'Please enter your Phone',
//         subText:
//             "Integer quis dictum tellus, a auctorlorem. Cras in biandit leo suspendiss.",
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: controllerName,
//                       decoration: const InputDecoration(
//                         hintText: 'Name',
//                         filled: true,
//                         fillColor: Color(0xFFF5FCF9),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16.0 * 1.5, vertical: 16.0),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.all(Radius.circular(50)),
//                         ),
//                       ),
//                       keyboardType: TextInputType.name,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "enter a valid  Phone";
//                         } else if (value.length < 2) {
//                           return "Too Short for a Phone Number";
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         controllerName.text = value!;
//                       },
//                     ),
//                     //////////////////////
//                     TextFormField(
//                       controller: controllerAge,
//                       decoration: const InputDecoration(
//                         hintText: 'age',
//                         filled: true,
//                         fillColor: Color(0xFFF5FCF9),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16.0 * 1.5, vertical: 16.0),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.all(Radius.circular(50)),
//                         ),
//                       ),
//                       keyboardType: TextInputType.phone,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "enter a valid  age";
//                         } else if (value.length > 2) {
//                           return "Too Longe for a age Number";
//                         }

//                         return null;
//                       },
//                       onSaved: (value) {
//                         controllerAge.text = value!;
//                       },
//                     ),
//                   ],
//                 )),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 _formKey.currentState!.save();
//                 var s1 = StudentModel(
//                     name: controllerName.text,
//                     age: int.parse(controllerAge.text));
//                 context.read<StudentCubit>().submitStudent(s1);

//                 context.pushNamed(Routes.home);

//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text("Done Insert"),
//                   backgroundColor: Color.fromARGB(255, 8, 235, 19),
//                 ));
//               }
//             },
//             style: ElevatedButton.styleFrom(
//               elevation: 0,
//               backgroundColor: const Color(0xFF00BF6D),
//               foregroundColor: Colors.white,
//               minimumSize: const Size(double.infinity, 48),
//               shape: const StadiumBorder(),
//             ),
//             child: const Text("Next"),
//           ),
//           const SizedBox(height: 200),
//         ],
//       ),
//     );
//   }
// }

// class LogoWithTitle extends StatelessWidget {
//   final String title, subText;
//   final List<Widget> children;

//   const LogoWithTitle(
//       {super.key,
//       required this.title,
//       this.subText = '',
//       required this.children});
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: LayoutBuilder(builder: (context, constraints) {
//         return SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             children: [
//               // SizedBox(height: constraints.maxHeight * 0.1),
//               // Image.network(
//               //   "",
//               //   height: 100,
//               // ),
//               SizedBox(
//                 height: constraints.maxHeight * 0.1,
//                 width: double.infinity,
//               ),
//               Text(
//                 title,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall!
//                     .copyWith(fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: Text(
//                   subText,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     height: 1.5,
//                     color: Theme.of(context)
//                         .textTheme
//                         .bodyLarge!
//                         .color!
//                         .withOpacity(0.64),
//                   ),
//                 ),
//               ),
//               ...children,
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
