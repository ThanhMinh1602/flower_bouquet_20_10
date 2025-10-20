import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flower_bouquet_20_10/screens/home_screen.dart';
import 'package:flower_bouquet_20_10/screens/home_screen_ni.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String REQUIRED_PASSWORD = 'homi123';

  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  @override
  void dispose() {
    _passwordController.dispose();
  }

  Future<void> _showPasswordDialog() async {
    _passwordController.text = '';
    _obscurePassword = true;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Nhập mật khẩu'),
              content: TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                onSubmitted: (_) => _checkPassword(context),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Hủy'),
                ),
                ElevatedButton(
                  onPressed: () => _checkPassword(context),
                  child: const Text('Xác nhận'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _checkPassword(BuildContext dialogContext) {
    final entered = _passwordController.text.trim();

    if (entered == REQUIRED_PASSWORD) {
      Navigator.of(dialogContext).pop(); // đóng dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreenNi()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Sai mật khẩu, vui lòng thử lại!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '💐 Chúc mừng ngày Phụ nữ Việt Nam 20-10 💐',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.pink[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 220,
                          height: 250,
                          child: Lottie.asset('assets/flower1.json'),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Lottie.asset('./assets/tappinghand.json'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: _showPasswordDialog,
              child: Image.network('assets/sun.png', width: 50),
            ),
          ),
        ],
      ),
    );
  }
}
