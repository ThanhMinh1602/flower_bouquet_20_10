import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final List<String> flowerImages = List.generate(
    30,
    (i) => 'assets/ni/n${i + 1}.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.pink.shade100, Colors.purple.shade50],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // 🌸 Hoa bay xen kẽ
            ...List.generate(25, (index) {
              return BubbleFlower(
                imagePath:
                    flowerImages[math.Random().nextInt(flowerImages.length)],
                delay: index * 0.8,
                index: index,
              );
            }),

            // 💧 Bọt biển nhỏ li ti bay ngẫu nhiên
            ...List.generate(50, (index) {
              return BubbleParticle(delay: index * 0.4);
            }),
          ],
        ),
      ),
    );
  }
}

// 🌸 Hoa bay
class BubbleFlower extends StatefulWidget {
  final String imagePath;
  final double delay;
  final int index;

  const BubbleFlower({
    super.key,
    required this.imagePath,
    required this.delay,
    required this.index,
  });

  @override
  State<BubbleFlower> createState() => _BubbleFlowerState();
}

class _BubbleFlowerState extends State<BubbleFlower>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double xPosition;
  late double size;
  final random = math.Random();

  double get duration => 12 + random.nextDouble() * 8; // 12–20s

  @override
  void initState() {
    super.initState();
    _randomizeBubble();

    _controller = AnimationController(
      duration: Duration(seconds: duration.toInt()),
      vsync: this,
    );

    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      if (mounted) _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _randomizeBubble();
        _controller.forward(from: 0);
      }
    });
  }

  void _randomizeBubble() {
    final width =
        WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
    xPosition = random.nextDouble() * width;
    size = 25 + random.nextDouble() * 45;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = _controller.value;
        final top = height - (progress * (height + 100));
        final sway = math.sin(progress * math.pi * 2) * 20;
        final opacity = progress < 0.1
            ? progress * 10
            : (progress > 0.9 ? (1 - progress) * 10 : 1.0);

        return Positioned(
          top: top,
          left: xPosition + sway,
          child: Opacity(
            opacity: opacity.clamp(0.0, 1.0),
            child: GestureDetector(
              onTap: () => _showFullImage(context),
              child: Hero(
                tag: '${widget.imagePath}_${widget.index}',
                child: ClipOval(
                  child: Image.network(
                    widget.imagePath,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFullImage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => FullScreenImage(
          imagePath: widget.imagePath,
          heroTag: '${widget.imagePath}_${widget.index}',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 💧 Bọt biển nhỏ li ti
class BubbleParticle extends StatefulWidget {
  final double delay;

  const BubbleParticle({super.key, required this.delay});

  @override
  State<BubbleParticle> createState() => _BubbleParticleState();
}

class _BubbleParticleState extends State<BubbleParticle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double xPosition;
  late double size;
  final random = math.Random();

  double get duration => 6 + random.nextDouble() * 4; // 6–10s

  @override
  void initState() {
    super.initState();
    _randomizeParticle();

    _controller = AnimationController(
      duration: Duration(seconds: duration.toInt()),
      vsync: this,
    );

    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      if (mounted) _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _randomizeParticle();
        _controller.forward(from: 0);
      }
    });
  }

  void _randomizeParticle() {
    final width =
        WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
    xPosition = random.nextDouble() * width;
    size = 2 + random.nextDouble() * 3; // nhỏ li ti
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = _controller.value;
        final top = height - (progress * (height + 50));
        final sway = math.sin(progress * math.pi * 2) * 10;
        final opacity = progress < 0.2
            ? progress * 5
            : (progress > 0.9 ? (1 - progress) * 10 : 1.0);

        return Positioned(
          top: top,
          left: xPosition + sway,
          child: Opacity(
            opacity: opacity.clamp(0.0, 1.0),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 🖼️ Hiển thị hình full
class FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String heroTag;

  const FullScreenImage({
    super.key,
    required this.imagePath,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: heroTag,
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 3,
                panEnabled: true,
                child: Image.network(imagePath, fit: BoxFit.contain),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 32),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
