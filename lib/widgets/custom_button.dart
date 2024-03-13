import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isLoading;

  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: isLoading == true ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Loading...',
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],

          ) : Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
