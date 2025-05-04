// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectwithsqllite/core/helper/extensions.dart';
import 'package:projectwithsqllite/core/routing/route.dart';
import 'package:projectwithsqllite/feature/view/sliver_list.dart';

// ignore: camel_case_types
class listView extends StatelessWidget {
  const listView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list View"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          // height: 400.h,
          // width: 400.w,
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  context.pushNamed(Routes.sliverAppbar);
                },
                // tileColor: Colors.black38,
                tileColor: const Color.fromARGB(70, 225, 216, 216),
                trailing: const Icon(Icons.exit_to_app),
                splashColor: const Color.fromARGB(255, 20, 123, 241),
                leading: const Icon(Icons.abc),
                title: const Text("title", style: TextStyle(fontSize: 20)),
                subtitle: const Text(
                  "subtitle",
                ),
              ),
              ListTile(
                  trailing: const Icon(Icons.exit_to_app),
                  leading: const Icon(Icons.abc),
                  title: const Text("title"),
                  subtitle: const Text("subtitle"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 119, 204, 132)),
                  )),
              const ListTile(
                trailing: Icon(Icons.exit_to_app),
                leading: Icon(Icons.abc),
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
              const ListTile(
                leading: Icon(Icons.abc),
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
              const ListTile(
                leading: Icon(Icons.abc),
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
