import 'package:get/get.dart';
import 'package:task_manager/view/screens/auth/controller/auth_controller.dart';
import 'package:task_manager/view/screens/home_screen/controller/home_controller.dart';

class DependancyInjection extends Bindings {
  @override
  void dependencies() {
    //================= Auth ==================
    Get.lazyPut(() => AuthenticationController());

    //================= Home Controller ==================

    Get.lazyPut(() => HomeController());
  }
}
