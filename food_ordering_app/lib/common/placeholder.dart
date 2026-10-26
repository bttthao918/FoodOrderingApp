import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double width;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.width = 357,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: errorText == null ? 64 : 84,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          filled: true,
          fillColor: const Color(0xFFF1F4FF),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF2442CC), width: 2),
          ),
          errorText: errorText,
        ),
      ),
    );
  }
}
