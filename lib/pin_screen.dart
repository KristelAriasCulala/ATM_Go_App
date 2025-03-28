import 'package:flutter/material.dart';
import 'home_screen.dart';

class PinEntryScreen extends StatefulWidget {
  @override
  _PinEntryScreenState createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  String enteredPin = "";

  void onNumberPressed(String number) {
    if (enteredPin.length < 4) {
      setState(() {
        enteredPin += number;
      });
    }
  }

  void onDelete() {
    if (enteredPin.isNotEmpty) {
      setState(() {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      });
    }
  }

  void onCheck() {
    if (enteredPin.length == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C2C2C),
      body: Stack(
        children: [

          Positioned(
            left: -150,
            bottom: -300,
            child: CustomPaint(
              size: Size(400, 400),
              painter: CirclePainter(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ATM GO",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.lock,
                color: Colors.red,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                "Ready when you are,\nUSER!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: index < enteredPin.length
                          ? Colors.white
                          : Colors.grey,
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              buildKeypad(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildKeypad() {
    List<String> keys = [
      '1', '2', '3',
      '4', '5', '6',
      '7', '8', '9',
      '✔', '0', '⌫',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double circleSize = constraints.maxWidth / 5;
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1.5,
            ),
            itemCount: keys.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (keys[index] == '⌫') {
                    onDelete();
                  } else if (keys[index] == '✔') {
                    onCheck();
                  } else {
                    onNumberPressed(keys[index]);
                  }
                },
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    keys[index],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Custom painter for circles
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Dark gray circle (largest)
    paint.color = Color(0xFF3D3D3D);
    canvas.drawCircle(
      Offset(size.width / 2 - 30, size.height / 2),
      size.width / 1.80, // Make circle bigger
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