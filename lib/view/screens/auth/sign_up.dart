import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/app_routes.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/static_strings/static_strings.dart';
import 'package:task_manager/view/screens/auth/controller/auth_controller.dart';
import 'package:task_manager/view/widget/custom_button.dart';
import 'package:task_manager/view/widget/custom_text.dart';
import 'package:task_manager/view/widget/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),

              ///<===================== Title text =========================>

              const Center(
                  child: CustomText(
                text: AppStaticStrings.createAccount,
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),

              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 44.h),
                          alignment: Alignment.center,
                          height: 100.r,
                          width: 100.r,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.light),
                          child: FlutterLogo(
                            size: 70.r,
                          ),
                        ),
                      ],
                    ),

                    ///<===================================Name section============================>
                    SizedBox(
                      height: 31.h,
                    ),

                    CustomText(
                      text: AppStaticStrings.fullName,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                    ),

                    CustomTextField(
                      textEditingController:
                          authenticationController.fullNameController.value,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return AppStaticStrings.fieldCantBeEmpty;
                        } else if (value.length < 4) {
                          return AppStaticStrings.enterAValidName;
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      //   textEditingController: controller.fullNameSignUp,
                      hintText: AppStaticStrings.fullName,
                    ),

                    ///<===========================Email section======================================>

                    CustomText(
                      text: AppStaticStrings.email,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                      top: 8.h,
                    ),
                    CustomTextField(
                      textEditingController:
                          authenticationController.signupEmailController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStaticStrings.enterValidEmail;
                        } else if (!AppStaticStrings.emailRegexp.hasMatch(
                            authenticationController
                                .signupEmailController.value.text)) {
                          return AppStaticStrings.enterValidEmail;
                        } else {
                          return null;
                        }
                      },

                      textInputAction: TextInputAction.next,
                      // textEditingController: controller.emailSignUp,
                      hintText: AppStaticStrings.email,
                    ),

                    ///<=================================phone number section=============================>
                    CustomText(
                      text: AppStaticStrings.phoneNumber,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                      top: 8.h,
                    ),

                    CustomTextField(
                      textEditingController:
                          authenticationController.phoneNumberController.value,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return AppStaticStrings.fieldCantBeEmpty;
                        } else if (value.length < 4) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                      //textEditingController: controller.phoneSignUp,
                      textInputAction: TextInputAction.next,
                      hintText: AppStaticStrings.phoneNumber,
                      keyboardType: TextInputType.phone,
                    ),

                    ///<==============================Password section====================================>
                    CustomText(
                      text: AppStaticStrings.password,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                      top: 8.h,
                    ),

                    CustomTextField(
                      textEditingController: authenticationController
                          .signupPasswordController.value,
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
                      textInputAction: TextInputAction.next,
                      //textEditingController: controller.passSignUp,
                      isPassword: true,
                      hintText: AppStaticStrings.password,
                    ),

                    ///<==========================Confirm password========================================>
                    CustomText(
                      text: AppStaticStrings.confirmPassword,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      bottom: 8.h,
                      top: 8.h,
                    ),

                    CustomTextField(
                      textEditingController: authenticationController
                          .confirmPasswordController.value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppStaticStrings.fieldCantBeEmpty;
                        } else if (value !=
                            authenticationController
                                .signupPasswordController.value.text) {
                          return "Password should match";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      isPassword: true,
                      hintText: AppStaticStrings.confirmPassword,
                    ),

                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),

              ///<==============================================Sign Up Button==========================================>
              CustomButton(
                fillColor: AppColors.redNormal,
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
                title: AppStaticStrings.signUp,
              ),

              SizedBox(
                height: 32.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: AppStaticStrings.alreadyHaveAnAccount,

                    /// <==============================Sign in text==============================>
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(AppRoute.signIn);
                    },
                    child: const CustomText(
                      color: AppColors.blueNormal,
                      text: AppStaticStrings.logIn,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 18.h,
              ),
            ],
          ),
        ),
      );
    }));
  }
}
