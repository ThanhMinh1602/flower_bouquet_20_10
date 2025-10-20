import 'package:flower_bouquet_20_10/screens/content_screen.dart';
import 'package:flower_bouquet_20_10/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class HomeScreenNi extends StatefulWidget {
  const HomeScreenNi({super.key});

  @override
  State<HomeScreenNi> createState() => _HomeScreenNiState();
}

class _HomeScreenNiState extends State<HomeScreenNi> {
  bool _showTapping = false;

  @override
  void initState() {
    super.initState();
    // Sau 3 giây hiển thị tapping
    Timer(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showTapping = true;
        });
      }
    });

    // Sau 8 giây (3s + 5s) ẩn tapping
    Timer(Duration(seconds: 8), () {
      if (mounted) {
        setState(() {
          _showTapping = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 50.0,
        children: [
          Text(
            'Tặng em nè!',
            style: TextStyle(
              shadows: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.pinkAccent.withOpacity(0.5),
                  blurRadius: 50,
                ),
              ],
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.pinkAccent,
            ),
          ),
          GestureDetector(
            onTap: () async {
              final isClose = await showDialog(
                context: context,
                builder: (context) => Custom20Dialog10(
                  message:
                      'Em chính là một món quà đặc biệt không gì có thể thay thế được. Nhân dịp 20/10, chúc em tất cả những gì tốt đẹp nhất và luôn là chính mình nhé.',
                  textBtn: 'Hihi, dễ thương ghê',
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                ),
              );
              if (isClose == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContentScreen()),
                );
              }
            },
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.pinkAccent, blurRadius: 50),
                    ],
                  ),
                  child: Image.asset('./assets/gau2.gif'),
                ),
                // Chỉ hiển thị tapping khi _showTapping = true
                if (_showTapping)
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Lottie.asset('./assets/tappinghand.json'),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
