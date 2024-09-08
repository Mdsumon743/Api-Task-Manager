import 'package:get/get.dart';
import 'package:task_manager/view/screens/auth/otp_verify.dart';
import 'package:task_manager/view/screens/auth/sign_in.dart';
import 'package:task_manager/view/screens/auth/sign_up.dart';
import 'package:task_manager/view/screens/home_screen/home_screen.dart';
import 'package:task_manager/view/screens/splash_screen/splash_screen.dart';

class AppRoute {
  //======================== Init ======================

  static const String splashScreen = "/splash_screen";

  //======================== Auth ======================
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String varifyOTP = "/varifyOTP";

  static const String homeScreen = "/home_screen";

  static List<GetPage> routes = [
    //======================== Init ======================

    GetPage(name: splashScreen, page: () => const SplashScreen()),

    //======================== Auth ======================
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: varifyOTP, page: () => const OtpVerify()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
  ];
}
