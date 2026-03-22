import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.onChanged,
  });
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColor.goldColor),
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.blackColor.withValues(alpha: 0.7),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        hintStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
