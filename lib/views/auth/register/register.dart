import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/views/auth/login/login.dart';
import 'package:pw_ecommerce/views/auth/profile_setup/profile_setup.dart';

import '../../../utils/colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_title_subtitle.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleAndSubtitle(
                  title: 'Create Account',
                  subtitle:
                      "Create an account so you can explore all the existing jobs",
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: 'Email',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: 'Password',
                      isSecured: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: 'Confirm Password',
                      isSecured: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: 'Sign Up',
                      onTap: () => Get.to(() => const ProfileSetupScreen()),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomButton(
                      title: 'Already have an account',
                      backgroundColor: Colors.transparent,
                      textColor: Colors.black,
                      onTap: () => Get.to(() => const LoginScreen()),
                    ),
                  ],
                ),
                SizedBox(),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
