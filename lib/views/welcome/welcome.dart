import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/utils/colors.dart';
import 'package:pw_ecommerce/views/auth/login/login.dart';
import 'package:pw_ecommerce/views/auth/register/register.dart';
import 'package:pw_ecommerce/widgets/custom_button.dart';
import 'package:pw_ecommerce/widgets/custom_title_subtitle.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/welcome.png'),
            const CustomTitleAndSubtitle(
              title: 'Discover Your Dream Job here',
              subtitle: 'Explore all the existing job roles based on your interest and study major',
            ),
            const SizedBox(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Login',
                    onTap: () => Get.to(() => const LoginScreen()),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomButton(
                    title: 'Register',
                    backgroundColor: Colors.transparent,
                    textColor: Colors.black,
                    onTap: () => Get.to(() => const RegisterScreen()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
