import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverAppbar extends StatelessWidget {
  const SliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Floating App Bar';

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            foregroundColor: Colors.amber,
            floating: false,
            pinned: true,
            expandedHeight: 150.0,
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            flexibleSpace: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 200.w,
                  child: const FlexibleSpaceBar(
                     
                      title: Text(
                        "User Status",
                        style: TextStyle(color: Colors.amber),
                      )),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.amber,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.amber,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, i) {
              return ListTile(
                  title: Text(
                "Item $i",
                style:
                    const TextStyle(color: Color.fromARGB(255, 250, 250, 249)),
              ));
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}
