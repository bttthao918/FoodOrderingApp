import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class MiniCard extends StatelessWidget {
  final String image;
  final Color backgroundColor;
  final double size;

  const MiniCard({
    super.key,
    required this.image,
    this.backgroundColor = AppColors.primaryLight,
    this.size = 76,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}
