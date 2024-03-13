import 'package:flutter/material.dart';
import 'package:pw_ecommerce/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final bool? isSecured;
  final bool? isRequired;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.title,
    this.isSecured,
    this.isRequired,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: isRequired == true ? (String? value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }

        return null;
      } : null,
      obscureText: isSecured ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.fieldBackground,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        hintText: title,
      ),
    );
  }
}
