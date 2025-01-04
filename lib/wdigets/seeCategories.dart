import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/view/single_category.dart';
import 'package:book/wdigets/custom_container.dart';
import 'package:flutter/material.dart';

GestureDetector seeCategories({
  required String txt,
  required BuildContext ctx,
}) {
  return GestureDetector(
    onTap: () {
      // Perform action on button press

      Navigator.push(
          ctx, MaterialPageRoute(builder: (context) => SingleCategory()));
    },
    child: CustomContainer(
      margin: EdgeInsets.only(top: 8),
      width: double.infinity,
      color: AppColors.light2,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      height: 64,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: CustomContainer(
                width: 40,
                height: 40,
                color: AppColors.light2,
                child: Image.asset('assets/images/hod.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "$txt",
              style: TextStyles.mainStyle
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ),
  );
}
