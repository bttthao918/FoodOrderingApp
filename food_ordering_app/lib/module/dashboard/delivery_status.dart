import 'package:flutter/material.dart';

import '/common/status.dart';
import '/theme/app_theme.dart';
import '/common/mini_card.dart';
import '../home/home_screen.dart';

class DeliveryStatus extends StatelessWidget {
  final String name;

  const DeliveryStatus({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 136,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen(name: name)),
                  (route) => false,
                );
              },
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
            const StatusRow(
              image: 'assets/images/order_logo.png',
              backgroundColor: Color(0xFFFFF9E9),
              title: 'Order Taken',
              isDone: true,
            ),
            const StatusDivider(),
            const StatusRow(
              image: 'assets/images/bill_logo.png',
              backgroundColor: Color(0xFFF2F0F8),
              title: 'Order Is Being Prepared',
              isDone: true,
            ),
            const StatusDivider(),
            const StatusRow(
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
            const StatusDivider(height: 44),
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
