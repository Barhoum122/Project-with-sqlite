import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectwithsqllite/core/Model/StudentModel.dart';
import 'package:projectwithsqllite/core/cubit/student_cubit.dart';
import 'package:projectwithsqllite/core/repositery/student_repositery.dart';
import 'package:projectwithsqllite/core/repositery/web_services.dart';

import 'package:projectwithsqllite/feature/home/list.dart';
import 'package:projectwithsqllite/feature/view/addStudent.dart';
import 'package:projectwithsqllite/feature/view/edit_task_screen.dart';
import 'package:projectwithsqllite/feature/view/sliver_list.dart';

import 'package:projectwithsqllite/feature/view/home.dart';

import 'route.dart';

class AppRouter {
  late StudentRepositery repository =
      StudentRepositery(webServices: WebServices());
  // late StudentCubit studentCubit = StudentCubit(repository);
  //final arregment = settings.arguments;
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.addStudent:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => StudentCubit(repository),
                  child: const Addstudent(),
                ));

      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => StudentCubit(repository),
                  child: const Homepge(),
                ));
      case Routes.listViewbuilder:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => StudentCubit(repository),
                  child: const listViewBuilder(),
                ));

      case Routes.editTaskScreen:
        final student = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => StudentCubit(repository),
                  child: EditTaskScreen(student: student as StudentModel),
                ));
                
      // case Routes.listview:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<StudentCubit>.value(
      //       value: studentCubit,
      //       child: const Listvieww(
      //         student: [],
      //       ),
      //     ),
      //   );
      case Routes.sliverAppbar:
        return MaterialPageRoute(
          builder: (_) => const SliverAppbar(),
        );
      default:
        return null;
    }
  }
}
