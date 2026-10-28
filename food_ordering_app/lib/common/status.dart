import 'package:flutter/material.dart'; 
import '../../theme/app_theme.dart';
import '../../common/mini_card.dart';

class StatusRow extends StatelessWidget {
  final String image;
  final Color backgroundColor;
  final String title;
  final String? description;
  final bool isDone;

  const StatusRow({
    required this.image,
    required this.backgroundColor,
    required this.title,
    this.description,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MiniCard(image: image, size: 62, backgroundColor: backgroundColor),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.body),
              if (description != null) ...[
                const SizedBox(height: 6),
                Text(
                  description!,
                  style: const TextStyle(color: AppColors.text, fontSize: 13),
                ),
              ],
            ],
          ),
        ),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: isDone ? const Color(0xFF45D16B) : AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isDone ? Icons.check : Icons.phone_in_talk,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class StatusDivider extends StatelessWidget {
  final double height;

  const StatusDivider({this.height = 26});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(left: 29),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            (height / 6).floor(),
            (_) => Container(width: 3, height: 3, color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
