import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/views/home/home.dart';

import '../views/auth/profile_setup/profile_setup.dart';

class AuthController extends GetxController {
  RxString email = RxString('');
  RxString password = RxString('');
  RxString cPassword = RxString('');
  RxString fullName = RxString('');
  RxString address = RxString('');
  RxString phoneNumber = RxString('');
  RxBool isLoading = RxBool(false);

  final formKey = GlobalKey<FormState>();
  final setupFormKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;

  signUp() async {
    if (formKey.currentState!.validate()) {
      if (password.value != cPassword.value) {
        Get.snackbar(
          'Invalid Password',
          "Password & Confirm Password doesn't matched",
        );

        return;
      }

      isLoading.value = true;
      update();

      try {
        await auth
            .createUserWithEmailAndPassword(
          email: email.value,
          password: password.value,
        )
            .then((value) {
          isLoading.value = false;
          update();
          if (value.user != null) {
            Get.to(
              () => const ProfileSetupScreen(),
            );
          }
        });
      } on FirebaseAuthException catch (error) {
        isLoading.value = false;
        update();
        Get.snackbar('Error', error.message ?? 'Something is wrong');
        print('Error is ${error.message}');
      }
    }
  }

  profileSetup() async {
    isLoading.value = true;
    update();

    final token = await FirebaseMessaging.instance.getToken();

    await FirebaseFirestore.instance.collection('users').doc(email.value).set({
      'email': email.value,
      'full_name': fullName.value,
      'address': address.value,
      'phone_number': phoneNumber.value,
      'token': token,
    });

    isLoading.value = false;
    update();
    Get.offAll(() => const HomeScreen());
  }

  login() async {
    isLoading.value = true;
    update();


    try {
      await auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      ).then((value) {
        isLoading.value = false;
        update();
        if (value.user != null) {
          Get.offAll(() => const HomeScreen());
        }
      });

    } on FirebaseAuthException catch (error) {
      isLoading.value = false;
      update();
      Get.snackbar('Error', error.message ?? 'Something is wrong');
      print('Error is ${error.message}');
    }
  }
}
