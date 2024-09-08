import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  ///========================= Sign In =========================

  static Rx<TextEditingController> emailController =
      TextEditingController().obs;
  static Rx<TextEditingController> passwordController =
      TextEditingController().obs;

  ///========================= Sign Up =========================

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> signupEmailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> signupPasswordController =
      TextEditingController().obs;

  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  Rx<TextEditingController> newPasswordController = TextEditingController().obs;

  Rx<TextEditingController> oldPasswordController = TextEditingController().obs;

  RxString activationCode = "".obs;
}
