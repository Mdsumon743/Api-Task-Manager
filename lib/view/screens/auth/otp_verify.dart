import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/static_strings/static_strings.dart';
import 'package:task_manager/view/screens/auth/controller/auth_controller.dart';
import 'package:task_manager/view/widget/custom_button.dart';
import 'package:task_manager/view/widget/custom_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();

  final formKey = GlobalKey<FormState>();
  int _secondsRemaining = 30;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ///<=================================Title Text=====================================>
                  const Center(
                      child: CustomText(
                    color: AppColors.blueNormal,
                    text: AppStaticStrings.checkYourEmail,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
                  const CustomText(
                    text: AppStaticStrings.wehaveSendAnOTP,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    maxLines: 3,
                    top: 8,
                  ),

                  SizedBox(
                    height: 68.h,
                  ),

                  ///<======================================Pin Code Field============================>

                  PinCodeTextField(
                    textStyle: const TextStyle(color: AppColors.lightActive),
                    keyboardType: TextInputType.phone,
                    autoDisposeControllers: false,
                    cursorColor: AppColors.blackyDarkActive,
                    appContext: (context),
                    onCompleted: (value) {
                      authenticationController.activationCode.value = value;
                    },
                    validator: (value) {
                      if (value!.length == 6) {
                        return null; // Input is valid
                      } else {
                        return "Please enter a 6-digit OTP code"; // Input is invalid
                      }
                    },
                    autoFocus: true,
                    pinTheme: PinTheme(
                      disabledColor: Colors.transparent,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 49.h,
                      fieldWidth: 47,
                      activeFillColor: AppColors.lightDarkActive,
                      selectedFillColor: AppColors.lightDarkActive,
                      inactiveFillColor: AppColors.lightDarkActive,
                      borderWidth: 0.5,
                      errorBorderColor: Colors.red,
                      activeBorderWidth: 0.8,
                      selectedColor: AppColors.lightDarkActive,
                      inactiveColor: AppColors.lightDarkActive,
                      activeColor: AppColors.lightDarkActive,
                    ),
                    length: 6,
                    enableActiveFill: true,
                  ),

                  SizedBox(
                    height: 28.h,
                  ),

                  ///<==============================Resend Button=============================>

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        if (_secondsRemaining == 0) {
                          _secondsRemaining = 30;
                          startTimer();
                        }
                      },
                      child: CustomText(
                          text: _secondsRemaining == 0
                              ? "Resend OTP".tr
                              : "Resend OTP $_secondsRemaining",
                          color: AppColors.lightDark,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  ///<================================== Verify Button ===========================>
                  CustomButton(
                    fillColor: AppColors.redNormal,
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    title: AppStaticStrings.verifyCode,
                  ),
                ],
              ),
            )));
  }
}
