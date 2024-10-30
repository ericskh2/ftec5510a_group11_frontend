import 'package:flutter/material.dart';
class TickIconWithCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tick Icon with Circle")),
      body: Center(
        child: Container(
          width: 100, // Fixed size for the circle
          height: 100, // Fixed size for the circle
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green, width: 5),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.green,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
