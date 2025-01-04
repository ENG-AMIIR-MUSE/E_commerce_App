import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/wdigets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Leading Profile Image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Title Dropdown
          CustomContainer(
            width: 72,
            height: 40,
            color: AppColors.light2,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Men",
                  style: TextStyles.mainStyle.copyWith(fontSize: 12),
                ),
                Icon(Icons.arrow_drop_down_sharp),
              ],
            ),
          ),
          // Shopping Bag Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.whiteTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
