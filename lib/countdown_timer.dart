import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  static const int totalTime = 600; // 10 minutes in seconds
  late int remainingTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingTime = totalTime;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingTime % 60).toString().padLeft(2, '0');

    return SizedBox(
      width: 50,  // Circle width
      height: 50, // Circle height
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: remainingTime / totalTime,
            strokeWidth: 5, // Thinner border
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
          Text(
            '$minutes:$seconds',
            style: const TextStyle(
              fontSize: 10, // Smaller font size to fit the circle
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
