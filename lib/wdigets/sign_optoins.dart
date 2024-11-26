import 'package:book/core/constants/app_colors.dart';
import 'package:book/wdigets/custom_container.dart';
import 'package:flutter/material.dart';

CustomContainer SignOptions({required Widget child}) {
  return CustomContainer(
      width: double.infinity,
      height: 49,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: AppColors.light2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [child],
      ));
}