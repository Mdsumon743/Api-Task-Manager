import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';

ThemeData darkModeTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackyDarker,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.light),
      actionsIconTheme: IconThemeData(color: AppColors.light),
      backgroundColor: AppColors.blackyDarker,
    ));
