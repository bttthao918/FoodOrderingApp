import 'package:flutter/material.dart';

import '../../common/button.dart';
import 'auth_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.orange, // Nền trên
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white, // Nền dưới
                ),
              ),
            ],
          ),

          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/minifruit.png',
                        width: 50,
                        height: 38,
                      ),
                      const SizedBox(height: 24),

                      Image.asset(
                        'assets/images/fruit1.png',
                        width: 301,
                        height: 260,
                      ),

                      const SizedBox(height: 24),
                      Image.asset(
                        'assets/images/shadow.png',
                        width: 301,
                        height: 12,
                      ),

                      const SizedBox(height: 130),
                      const Text(
                        'Get The Freshest Fruit Salad Combo',
                        style: TextStyle(
                          fontFamily: 'Brandon Grotesque',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF27214D),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Brandon Grotesque',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF5D577E),
                        ),
                      ),
                      const SizedBox(height: 80),
                      CustomButton(
                        width: 327,
                        height: 56,
                        text: 'Let’s Continue',
                        backgroundColor: Colors.orange,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const AuthScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
