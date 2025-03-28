import 'dart:async';
import 'package:flutter/material.dart';
import 'pin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.1, end: 0.9).animate(_controller);

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PinEntryScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: Stack(
        children: [

          Positioned(
            left: -150,
            top: MediaQuery.of(context).size.height / 4,
            child: CustomPaint(
              size: Size(400, 400),
              painter: CirclePainter(),
            ),
          ),

          Center(
            child: Text(
              "ATM GO",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),

          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                top: 50,
                left: MediaQuery.of(context).size.width * _animation.value,
                child: redLine(),
              );
            },
          ),

          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                bottom: 50,
                right: MediaQuery.of(context).size.width * _animation.value,
                child: redLine(),
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget for red lines
  Widget redLine() {
    return Row(
      children: [
        Container(
          height: 8,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 4,
          width: 100,
          color: Colors.red,
        ),
      ],
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    paint.color = Color(0xFF3D3D3D);
    canvas.drawCircle(
      Offset(size.width / 2 - 30, size.height / 2),
      size.width / 1.80,
      paint,
    );

    // Medium gray circle (medium)
    paint.color = Color(0xFF4B4B4B);
    canvas.drawCircle(
      Offset(size.width / 2 - 30, size.height / 2),
      size.width / 2.5,
      paint,
    );

    // Light gray circle (smallest)
    paint.color = Color(0xFF595959);
    canvas.drawCircle(
      Offset(size.width / 2 - 30, size.height / 2),
      size.width / 4,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}