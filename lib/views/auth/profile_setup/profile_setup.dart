import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/controllers/auth_controller.dart';
import 'package:pw_ecommerce/utils/colors.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_title_subtitle.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();

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
                  title: 'Profile Setup',
                  subtitle:
                      "Please fill be below details to complete your profile.",
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: controller.setupFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://static.vecteezy.com/system/resources/thumbnails/002/534/006/small/social-media-chatting-online-blank-profile-picture-head-and-body-icon-people-standing-icon-grey-background-free-vector.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        title: 'Full Name',
                        onChanged: (name) => controller.fullName.value = name,
                        isRequired: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: 'Address',
                        onChanged: (address) =>
                            controller.address.value = address,
                        isRequired: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: 'Phone Number',
                        isRequired: true,
                        onChanged: (phone) =>
                            controller.phoneNumber.value = phone,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        title: 'Complete Setup',
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          if (controller.setupFormKey.currentState!.validate()) {
                            controller.profileSetup();
                          }
                        },
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
