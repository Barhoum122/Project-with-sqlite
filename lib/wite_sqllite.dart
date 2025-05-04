import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectwithsqllite/core/routing/app_router.dart';
import 'package:projectwithsqllite/core/routing/route.dart';

class WithSqllite extends StatelessWidget {
  final AppRouter appRouter;
  const WithSqllite({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'With Sqllite App',
          theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 29, 52, 186),
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          // initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
          initialRoute: Routes.home,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
