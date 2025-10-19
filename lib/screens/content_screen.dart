import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen>
    with TickerProviderStateMixin {
  final List<String> flowerImages = [
    './assets/rose1.png',
    './assets/tulip.png',
    './assets/daisy.png',
    './assets/lily.png',
    './assets/sunflower.png',
    './assets/orchid.png',
    './assets/carnation.png',
    './assets/rose2.png',
    './assets/rose3.png',
    './assets/rose4.png',
    // ✅ THÊM HÌNH VÀO ĐÂY!
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink.shade50, Colors.purple.shade100, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // 💖 TEXT CHÍNH GIỮA
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '💕 EM ƠI 20/10 VUI NHỈ 💕',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [Colors.pink.shade400, Colors.red.shade400],
                        ).createShader(Rect.fromLTWH(0, 0, 300, 100)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Chạm vào hoa để xem to hơn nha! 🌸',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.pink.shade300,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // 🌧️ MƯA HÌNH ẢNH - RANDOM + LOOP VÔ HẠN
            ...List.generate(50, (index) {
              return RainyFlowerLoop(
                imagePath:
                    flowerImages[math.Random().nextInt(flowerImages.length)],
                index: index,
              );
            }),
          ],
        ),
      ),
    );
  }
}

// 🌸 MƯA HỒA LOOP VÔ HẠN - RANDOM TOÀN MÀN
class RainyFlowerLoop extends StatefulWidget {
  final String imagePath;
  final int index;

  const RainyFlowerLoop({
    super.key,
    required this.imagePath,
    required this.index,
  });

  @override
  State<RainyFlowerLoop> createState() => _RainyFlowerLoopState();
}

class _RainyFlowerLoopState extends State<RainyFlowerLoop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;

  // ✅ RANDOM XỊN: MỖI HÌNH CÓ VỊ TRÍ RIÊNG
  final random = math.Random(); // Random khác nhau mỗi lần
  double get xPosition => random.nextDouble(); // ✅ RANDOM X TOÀN MÀN
  double get size => 30 + random.nextDouble() * 50; // ✅ RANDOM SIZE
  double get duration => 12.0 + random.nextDouble() * 12; // ✅ RANDOM TIME
  bool get direction => random.nextBool(); // ✅ XOAY TRÁI/PHẢI

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: duration.toInt()),
      vsync: this,
    );

    // ✅ LOOP VÔ HẠN
    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: math.pi * 2 * (direction ? 1 : -1),
    ).animate(_positionAnimation);

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _positionAnimation, curve: Interval(0.05, 0.95)),
    );

    // ✅ START LOOP NGAY + LẶP MÃI
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _positionAnimation,
      builder: (context, child) {
        return Positioned(
          // ✅ RANDOM X TOÀN MÀN HÌNH
          left: xPosition * MediaQuery.of(context).size.width,
          // ✅ TỪ TRÊN XUỐNG CHẬM
          top: (_positionAnimation.value * (screenHeight + size)) - size,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: GestureDetector(
                onTap: () => _showFullScreen(context),
                child: Hero(
                  tag:
                      '${widget.imagePath}_${widget.index}_${random.nextInt(1000)}',
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [Colors.pink, Colors.red],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: size * 0.6,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFullScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => FullScreenFlower(
        imagePath: widget.imagePath,
        heroTag: '${widget.imagePath}_${widget.index}_${random.nextInt(1000)}',
        size: size,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 🖼️ FULL SCREEN
class FullScreenFlower extends StatelessWidget {
  final String imagePath;
  final String heroTag;
  final double size;

  const FullScreenFlower({
    super.key,
    required this.imagePath,
    required this.heroTag,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          // Mưa nhỏ background
          ...List.generate(20, (i) {
            final random = math.Random(i);
            return Positioned(
              left: random.nextDouble() * MediaQuery.of(context).size.width,
              top: random.nextDouble() * MediaQuery.of(context).size.height,
              child: Icon(
                Icons.favorite,
                color: Colors.pink.withOpacity(0.4),
                size: 8 + random.nextDouble() * 12,
              ),
            );
          }),
          Center(
            child: Hero(
              tag: heroTag,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.pink.withOpacity(0.6),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.favorite, color: Colors.white, size: 200),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close, color: Colors.white, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
