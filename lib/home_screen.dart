import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isHidden = true;
  String _amount = "1234.56";

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "My Account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.grey[400], size: 16),
                ],
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.attach_money, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    _isHidden ? "******" : _amount,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: _toggleVisibility,
                    child: Icon(
                      _isHidden ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Action Buttons (Deposit, Transfer, Scan QR)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  actionButton(Icons.add, "Deposit"),
                  actionButton(Icons.send, "Send/Transfer"),
                  actionButton(Icons.qr_code, "Scan QR"),
                ],
              ),
              SizedBox(height: 30),

              // Credit Card Design
              creditCardWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Credit Card Widget
  Widget creditCardWidget() {
    return Container(
      width: 330,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Color(0xFF3C3C3C), Color(0xFF1E1E1E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.credit_card, color: Colors.yellow[700], size: 30),
          SizedBox(height: 10),
          Text(
            "Credit Number",
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            "2213 4563 6789 6457",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/mastercard_logo.png',
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}