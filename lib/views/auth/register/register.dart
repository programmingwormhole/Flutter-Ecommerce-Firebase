import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/controllers/auth_controller.dart';
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
    final controller = Get.put(AuthController());

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTitleAndSubtitle(
                  title: 'Create Account',
                  subtitle:
                      "Create an account so you can explore all the existing jobs",
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: 'Email',
                        isRequired: true,
                        onChanged: (email) {
                          controller.email.value = email;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: 'Password',
                        isSecured: true,
                        isRequired: true,
                        onChanged: (password) =>
                            controller.password.value = password,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: 'Confirm Password',
                        isSecured: true,
                        isRequired: true,
                        onChanged: (cPassword) =>
                            controller.cPassword.value = cPassword,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => CustomButton(
                          isLoading: controller.isLoading.value,
                          title: 'Sign Up',
                          onTap: () => controller.signUp(),
                        ),
                      ),
                      const SizedBox(
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
                ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
