import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/view/sign_password.dart';
import 'package:book/wdigets/custom_button.dart';

import 'package:book/wdigets/custom_text_field.dart';
import 'package:book/wdigets/row_child.dart';
import 'package:book/wdigets/sign_option.dart';
import 'package:book/wdigets/sign_optoins.dart';
import 'package:flutter/material.dart';

class SignUP extends StatelessWidget {
  SignUP({super.key});

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
            const SizedBox(height: 100),
            const Text("Sign in", style: TextStyles.mainStyle),
            const SizedBox(height: 32),
            CustomTextField(
              borderRadius: BorderRadius.circular(4),
              controller: txt,
              hintText: "Enter Email Address",
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Continue",
              onPressed: () {
                // Perform action on button press

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignPassword()));
              },
            ),
            const SizedBox(height: 16),
            rowChild(txt1: "Dont Have Account ? ", txt2: "Create One"),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 71.0),
              child: Column(
                children: [
                  SignOptions(
                    child: signOPtion(
                      icon: Icons.facebook,
                      txt: "Continue With Google",
                    ),
                  ),
                  const SizedBox(height: 12),
                  SignOptions(
                    child: signOPtion(
                      icon: Icons.apple,
                      txt: "Continue With Apple",
                    ),
                  ),
                  const SizedBox(height: 12),
                  SignOptions(
                    child: signOPtion(
                      icon: Icons.facebook,
                      txt: "Continue With Facebook",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}