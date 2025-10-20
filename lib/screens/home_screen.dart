import 'package:flower_bouquet_20_10/screens/content_screen.dart';
import 'package:flower_bouquet_20_10/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showTapping = false;

  @override
  void initState() {
    super.initState();
    // Sau 3 giây hiển thị tapping
    Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showTapping = true);
    });

    // Sau 8 giây ẩn tapping
    Timer(const Duration(seconds: 8), () {
      if (mounted) setState(() => _showTapping = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chọn hoa để nhận lời chúc nhaaa mụi người 🌸🌼💐',
                  textAlign: TextAlign.center,
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
                const SizedBox(height: 40),

                // 🌸 Cụm hoa có thể nhấn
                SizedBox(
                  width: 290,
                  height: 400,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // 🌸 Ba bông hoa
                      Positioned(
                        bottom: 30,
                        left: 0,
                        right: 0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.rotate(
                              angle: math.pi / 6,
                              alignment: Alignment.bottomCenter,
                              child: Image.asset('assets/hoa1.gif', width: 200),
                            ),

                            Transform.rotate(
                              angle: -math.pi / 6,
                              alignment: Alignment.bottomCenter,
                              child: Image.asset('assets/hoa1.gif', width: 200),
                            ),
                            Image.asset('assets/hoa1.gif', width: 300),

                            _buildFlowerLeft(),
                            _buildFlowerCenter(),
                            _buildFlowerRight(),
                          ],
                        ),
                      ),

                      // 🌿 Chậu hoa
                      Positioned(
                        bottom: 0,
                        child: Image.asset('assets/chau1.png', width: 150),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // 💧 Bọt biển nhỏ li ti
            ...List.generate(500, (index) {
              return BubbleParticle(
                delay: index * 0.4,
                color: Colors.pinkAccent.withOpacity(0.2),
              );
            }),
            ...List.generate(500, (index) {
              return BubbleParticle(
                delay: index * 0.4,
                color: Colors.blueAccent.withOpacity(0.2),
              );
            }),
          ],
        ),
      ),
    );
  }

  Positioned _buildFlowerRight() {
    return Positioned(
      right: 35,
      top: 85,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Custom20Dialog10(
              message:
                  'Gửi đến những người phụ nữ tuyệt vời trong gia đình lời chúc tốt đẹp nhất! Chúc mọi người luôn tươi tắn, bình an, thành công và luôn được yêu thương mỗi ngày – không chỉ riêng ngày 20/10. ❤️',
              textBtn: 'Hihi, nhận lời chúc nè 😆',
              onTap: () {
                Navigator.pop(context, true);
              },
            ),
          );
        },
        child: CircleAvatar(backgroundColor: Colors.transparent, radius: 30),
      ),
    );
  }

  Positioned _buildFlowerCenter() {
    return Positioned(
      left: 0,
      right: 0,
      top: 40,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Custom20Dialog10(
              message:
                  'Nhân ngày 20/10, chúc tất cả những người phụ nữ thân yêu trong gia đình luôn mạnh khỏe, xinh đẹp, hạnh phúc và ngập tràn yêu thương. Cảm ơn vì đã luôn là những bông hoa rực rỡ nhất trong ngôi nhà của chúng ta! 💐',
              textBtn: 'Ôi, dễ thương quá đi 💕',

              onTap: () {
                Navigator.pop(context, true);
              },
            ),
          );
        },
        child: CircleAvatar(backgroundColor: Colors.transparent, radius: 40),
      ),
    );
  }

  Positioned _buildFlowerLeft() {
    return Positioned(
      left: 35,
      top: 85,
      child: GestureDetector(
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) => Custom20Dialog10(
              message:
                  'Chúc tất cả những người phụ nữ thân yêu trong gia đình luôn rạng rỡ như những đóa hoa mùa thu — lúc nào cũng được yêu thương, hạnh phúc và bình an. Cảm ơn mọi người đã làm cho ngôi nhà này luôn đầy ắp tiếng cười và ấm áp yêu thương! 💖',
              textBtn: 'Wow, hạnh phúc quá nha 🥰',
              onTap: () {
                Navigator.pop(context, true);
              },
            ),
          );
        },
        child: CircleAvatar(backgroundColor: Colors.transparent, radius: 30),
      ),
    );
  }
}
