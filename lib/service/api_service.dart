import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/core/app_routes.dart';
import 'package:task_manager/view/screens/auth/controller/auth_controller.dart';

class ApiService {
  static Future<void> loginWithApi() async {
    const String baseUrlLogin = 'http://103.161.9.133:3000/user/login';
    var body = {
      'email': AuthenticationController.emailController.value.text,
      'password': AuthenticationController.passwordController.value.text
    };
    try {
      final reponse = await http.post(
        Uri.parse(baseUrlLogin),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      var data = jsonDecode(reponse.body);
      if (reponse.statusCode == 200) {
        Get.snackbar('Success', data["message"]);
        Get.toNamed(AppRoute.homeScreen);
      } else {
        Get.snackbar('Error', data['error']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
