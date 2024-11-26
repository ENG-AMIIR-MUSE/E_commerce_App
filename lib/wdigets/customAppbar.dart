import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/wdigets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leadingWidth: 70, // Added width for leading to prevent shrinking
      leading: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
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
      ),
      title: CustomContainer(
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
            Icon(Icons.arrow_drop_down_sharp)
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        // Wrapping the Container with Padding for the action button
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Container(
            width: 40, // Fixed width to avoid shrinking
            height: 40, // Fixed height to avoid shrinking
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
        ),
      ],
    );
  }
}
