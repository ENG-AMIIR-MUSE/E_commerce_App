import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/view/about_your_self.dart';
import 'package:book/view/forget_password.dart';
import 'package:book/wdigets/custom_back.dart';
import 'package:book/wdigets/custom_button.dart';
import 'package:book/wdigets/custom_text_field.dart';
import 'package:book/wdigets/row_child.dart';

import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final TextEditingController txt = TextEditingController();
  final TextEditingController txt2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        // Add scroll functionality
        padding: const EdgeInsets.symmetric(
            horizontal: 23.0), // Add horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customBack(context, onPressed: () {
              Navigator.pop(context);
            }),
            const SizedBox(height: 20),
            const Text("Create Account ", style: TextStyles.mainStyle),
            const SizedBox(height: 32),
            CustomTextField(
              controller: txt,
              hintText: "First Name",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: txt,
              hintText: "Last Name",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: txt,
              hintText: "Enter Email Address",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: txt,
              isPassword: true,
              hintText: "Password",
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: "Continue",
              onPressed: () {
                // Perform action on button press

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutYourSelf()));
              },
            ),
            const SizedBox(height: 40),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPassword()));
                },
                child: rowChild(txt1: "Forgot Password ? ", txt2: "Reset")),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
