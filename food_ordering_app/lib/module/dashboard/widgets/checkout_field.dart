
import 'package:flutter/material.dart';

import '../../../common/placeholder.dart';
import '../../../theme/app_theme.dart';

class CheckoutField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? error;
  final TextInputType keyboardType;

  const CheckoutField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.error,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.text,
            fontFamily: 'Brandon Grotesque',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 16),

        CustomTextField(
          hintText: hint,
          controller: controller,
          errorText: error,
          keyboardType: keyboardType,
          width: double.infinity,
        ),
      ],
    );
  }
}
