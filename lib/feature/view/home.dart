import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectwithsqllite/core/cubit/student_cubit.dart';
import 'package:projectwithsqllite/feature/home/list.dart';
import 'package:projectwithsqllite/feature/view/iconTextSection.dart';
import 'package:projectwithsqllite/feature/view/title_Section.dart';

class Homepge extends StatefulWidget {
  const Homepge({super.key});

  @override
  State<Homepge> createState() => _HomepgeState();
}

class _HomepgeState extends State<Homepge> {
  @override
  void initState() {
    super.initState();
   // BlocProvider.of<StudentCubit>(context).GetAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 71, 62, 59),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Helw Word",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TitleSection(),
                SizedBox(
                  height: 4,
                ),

                SizedBox(
                  height: 4,
                ),
                iconAndText(),
                // listView(),

                // listViewBuilder()

                //SpacedItemsListbyCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
