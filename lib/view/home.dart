import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/wdigets/categories.dart';
import 'package:book/wdigets/customAppbar.dart';
import 'package:book/wdigets/custom_container.dart';
import 'package:book/wdigets/custom_text_field.dart';
import 'package:book/wdigets/row_child.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomContainer(
                  width: 400,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: CustomTextField(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 13.0,
                        horizontal: 15.0), // Adjust content padding
                    hintText: "Search",
                  )),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories ",
                    style: TextStyles.mainStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("See All",
                      style: TextStyles.mainStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Categories(txt: "Clothes"),
                    Categories(txt: "Fashions"),
                    Categories(txt: "Fashions"),
                    Categories(txt: "Fashions"),
                    Categories(txt: "Fashions"),
                    Categories(txt: "Fashions"),
                    Categories(txt: "Trousers"),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Selling ",
                    style: TextStyles.mainStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("See All",
                      style: TextStyles.mainStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              ListView(
                children: [
                  CustomContainer(
                    width: MediaQuery.of(context).size.width *
                        0.4, // Correct access to screen width
                    child: Text(""), // Ensure `child` is defined in your widget
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
