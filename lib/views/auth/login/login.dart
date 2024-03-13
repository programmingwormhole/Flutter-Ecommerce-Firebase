import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/controllers/auth_controller.dart';
import 'package:pw_ecommerce/views/auth/register/register.dart';
import 'package:pw_ecommerce/views/home/home.dart';
import 'package:pw_ecommerce/widgets/custom_app_bar.dart';
import 'package:pw_ecommerce/widgets/custom_button.dart';
import 'package:pw_ecommerce/widgets/custom_text_field.dart';
import 'package:pw_ecommerce/widgets/custom_title_subtitle.dart';
import '../../../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
                  title: 'Login Here',
                  subtitle: "Welcome back you’ve been missed!",
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: 'Email',
                        isRequired: true,
                        onChanged: (email) => controller.email.value = email,
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
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => CustomButton(
                          isLoading: controller.isLoading.value,
                          title: 'Sign In',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              controller.login();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomButton(
                        title: 'Create new account',
                        backgroundColor: Colors.transparent,
                        textColor: Colors.black,
                        onTap: () => Get.to(() => const RegisterScreen()),
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
