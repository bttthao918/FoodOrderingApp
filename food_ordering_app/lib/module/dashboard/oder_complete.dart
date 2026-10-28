import 'package:flutter/material.dart';

import '../../common/button.dart';
import '../home/home_screen.dart';
import 'delivery_status.dart';

class OderComplete extends StatelessWidget {
  final String name;

  const OderComplete({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/tick.png', width: 164, height: 164),
            const SizedBox(height: 50),
            const Text(
              'Congratulations!!!',
              style: TextStyle(
                fontFamily: 'Brandon Grotesque',
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color(0xFF27214D),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 300,
              height: 60,
              child: const Text(
                'Your order have been taken and is being attended to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Brandon Grotesque',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF27214D),
                ),
              ),
            ),
            const SizedBox(height: 80),
            CustomButton(
              width: 133,
              height: 56,
              text: 'Track order',
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryStatus(name: name),
                  ),
                );
                // Handle button press
              },
            ),
            const SizedBox(height: 50),
            CustomButton(
              width: 200,
              height: 56,
              text: 'Countinue shopping',
              backgroundColor: Colors.white,
              textColor: Colors.orange,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(name: name),
                  ),
                );
                // Handle button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
