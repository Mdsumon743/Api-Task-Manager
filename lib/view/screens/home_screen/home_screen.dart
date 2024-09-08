import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/static_strings/static_strings.dart';
import 'package:task_manager/view/widget/custom_button.dart';
import 'package:task_manager/view/widget/custom_text_field.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: AppColors.blackyDark,
              context: context,
              builder: (_) {
                return Container(
                  padding: EdgeInsets.all(20.w),
                  height: Get.size.height,
                  width: Get.size.width,
                  child: Column(
                    children: [
                      //======================= Title ====================
                      CustomTextField(
                        inputTextStyle:
                            const TextStyle(color: AppColors.blackyDark),
                        fillColor: AppColors.blueLightActive,
                        textEditingController: TextEditingController(),
                        textInputAction: TextInputAction.next,
                        // textEditingControl
                        //ler: controller.signInEmail,
                        hintText: AppStaticStrings.title,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      //======================= Description ====================

                      CustomTextField(
                        inputTextStyle:
                            const TextStyle(color: AppColors.blackyDark),
                        fillColor: AppColors.blueLightActive,
                        textEditingController: TextEditingController(),
                        textInputAction: TextInputAction.next,
                        // textEditingController: controller.signInEmail,
                        hintText: AppStaticStrings.description,
                      ),

                      SizedBox(
                        height: 16.h,
                      ),

                      //======================= Description ====================

                      CustomButton(
                        fillColor: AppColors.blueNormalHover,
                        onTap: () {
                          navigator?.pop();
                        },
                        title: AppStaticStrings.save,
                      )
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
