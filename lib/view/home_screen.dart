import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/data/categories.dart';
import 'package:book/view/see_all.dart';
import 'package:book/wdigets/card_contnet.dart';
import 'package:book/wdigets/categories.dart';
import 'package:book/wdigets/customAppbar.dart';
import 'package:book/wdigets/custom_container.dart';
import 'package:book/wdigets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomHeader(),
              SizedBox(
                height: 24,
              ),
              CustomContainer(
                  width: 400,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: CustomTextField(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    leadingIcon: Icons.search_rounded,
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SeeAll()));
                    },
                    child: Text("See All",
                        style: TextStyles.mainStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Categories(
                        txt: categories[index]['title'],
                        imagePath: categories[index]['imagePath'])),
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
              SizedBox(
                height: 32,
              ),
              CustomContainer(
                  width: double.infinity,
                  height: 281,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardContent(),
                      CardContent(),
                      CardContent(),
                      CardContent(),
                      CardContent(),
                    ],
                  )),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New ",
                    style: TextStyles.mainStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                  Text("See All",
                      style: TextStyles.mainStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              CustomContainer(
                  width: double.infinity,
                  height: 281,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardContent(),
                      CardContent(),
                      CardContent(),
                      CardContent(),
                      CardContent(),
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
