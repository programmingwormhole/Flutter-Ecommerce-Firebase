import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/utils/colors.dart';
import 'package:pw_ecommerce/utils/config.dart';
import 'package:pw_ecommerce/views/welcome/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: const Center(
          child: Text(AppConfig.appName, style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),),
        ),
      ),
    );
  }
}
