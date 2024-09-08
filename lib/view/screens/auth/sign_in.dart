import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/app_routes.dart';
import 'package:task_manager/service/api_service.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/static_strings/static_strings.dart';
import 'package:task_manager/view/screens/auth/controller/auth_controller.dart';
import 'package:task_manager/view/widget/custom_button.dart';
import 'package:task_manager/view/widget/custom_text.dart';
import 'package:task_manager/view/widget/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64.h,
              ),
              const CustomText(
                text: AppStaticStrings.welcomeBack,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.left,
                bottom: 20,
              ),

              const CustomText(
                text: AppStaticStrings.pleaseEnterYour,
                maxLines: 3,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                bottom: 10,
              ),
              const Divider(),

              ///============================= Form ============================
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStaticStrings.email,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        bottom: 16.h,
                        top: 30.h,
                      ),

                      ///<======================== Email section =========================>

                      CustomTextField(
                        textEditingController:
                            AuthenticationController.emailController.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStaticStrings.enterValidEmail;
                          } else if (!AppStaticStrings.emailRegexp.hasMatch(
                              AuthenticationController
                                  .emailController.value.text)) {
                            return AppStaticStrings.enterValidEmail;
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        // textEditingController: controller.signInEmail,
                        hintText: AppStaticStrings.enterYourEmail,
                      ),

                      ///<====================== Password section =======================>

                      CustomText(
                        text: AppStaticStrings.password,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        top: 16.h,
                        bottom: 16.h,
                      ),
                      CustomTextField(
                        textEditingController:
                            AuthenticationController.passwordController.value,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppStaticStrings.passWordMustBeAtLeast;
                          } else if (value.length < 8 ||
                              !AppStaticStrings.passRegexp.hasMatch(value)) {
                            return AppStaticStrings.passwordLengthAndContain;
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                        hintText: AppStaticStrings.enterYourPassword,
                      ),
                    ],
                  )),

              ///<============================== Login Button ====================================>

              SizedBox(
                height: 45.h,
              ),
              CustomButton(
                fillColor: AppColors.redNormal,
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    ApiService.loginWithApi();
                  }
                },
                title: AppStaticStrings.logIn,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: const Divider(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(text: AppStaticStrings.dontHaveAnyAccount),

                  ///========================= Sign Up Button ========================
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.signUp);
                      },
                      child: const CustomText(
                          color: AppColors.blueNormal,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          text: AppStaticStrings.signUp))
                ],
              )
            ],
          ),
        ));
      }),
    );
  }
}
