import 'package:flutter/material.dart';

import '../../common/mini_card.dart';
import '../../theme/app_theme.dart';

class DeliveryStatus extends StatelessWidget {
  const DeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 136,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.text,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              icon: const Icon(Icons.chevron_left, size: 24),
              label: const Text('Go back'),
            ),
            const Expanded(child: Center(child: Text('Delivery Status'))),
            const SizedBox(width: 76),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 38, 20, 28),
        child: Column(
          children: [
            const _StatusRow(
              image: 'assets/images/order_logo.png',
              backgroundColor: Color(0xFFFFF9E9),
              title: 'Order Taken',
              isDone: true,
            ),
            const _StatusDivider(),
            const _StatusRow(
              image: 'assets/images/bill_logo.png',
              backgroundColor: Color(0xFFF2F0F8),
              title: 'Order Is Being Prepared',
              isDone: true,
            ),
            const _StatusDivider(),
            const _StatusRow(
              image: 'assets/images/delivery_logo.png',
              backgroundColor: Color(0xFFFFF0F1),
              title: 'Order Is Being Delivered',
              description: 'Your delivery agent is coming',
              isDone: false,
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/map.png',
                width: double.infinity,
                height: 122,
                fit: BoxFit.cover,
              ),
            ),
            const _StatusDivider(height: 44),
            Row(
              children: [
                MiniCard(
                  image: 'assets/images/tick.png',
                  size: 62,
                  backgroundColor: const Color(0xFFEFFFF6),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text('Order Received', style: AppTextStyles.body),
                ),
                const Text(
                  '•••',
                  style: TextStyle(
                    color: Color(0xFFFFD9BC),
                    fontSize: 24,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String image;
  final Color backgroundColor;
  final String title;
  final String? description;
  final bool isDone;

  const _StatusRow({
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

class _StatusDivider extends StatelessWidget {
  final double height;

  const _StatusDivider({this.height = 26});

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
