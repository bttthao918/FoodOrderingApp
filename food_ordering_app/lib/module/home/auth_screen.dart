import 'package:flutter/material.dart';
import '../../common/button.dart';
import '../../common/placeholder.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
                      'assets/images/fruit2.png',
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
                      'What is your firstname?',
                      style: TextStyle(
                        fontFamily: 'Brandon Grotesque',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF27214D),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'Enter your full name',
                      controller: _nameController,
                    ),
                    const SizedBox(height: 80),
                    CustomButton(
                      width: 327,
                      height: 56,
                      text: 'Start Ordering',
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () {
                        final name = _nameController.text.trim();
                        if (name.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter your name'),
                            ),
                          );
                          return;
                        }

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(name: name),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
