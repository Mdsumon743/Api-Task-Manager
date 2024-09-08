import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/app_routes.dart';
import 'package:task_manager/core/dependency.dart';
import 'package:task_manager/global/theme/dark_theme.dart';

void main() {
  DependancyInjection di = DependancyInjection();

  di.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, child) {
        return GetMaterialApp(
          theme: darkModeTheme,
          debugShowCheckedModeBanner: false,
          getPages: AppRoute.routes,
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 200),
          navigatorKey: Get.key,
          initialRoute: AppRoute.splashScreen,
        );
      },
    );
  }
}
