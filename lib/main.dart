import 'package:flutter/material.dart';
import 'package:ftec5510a_group11_frontend/countdown_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My Simple App'),
      // ),
      body: Center(
        child: SingleChildScrollView(
          // Add scrollable view for better UI
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Authorize Your Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: 'Lalezar',
                  height: 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _buildInfoRow('Amount', '1000 HKD',
                  rightElement: CountdownTimer()),
              const SizedBox(height: 20),
              // Merchant
              _buildInfoRow(
                  'Merchant', 'CHINA MOBILE HONG KONG COMPANY LIMITED'),
              const SizedBox(height: 20),
              // Card Number
              _buildInfoRow('Card Number', '1234 1234 1234 1234'),
              const SizedBox(height: 20),
              // Time
              _buildInfoRow('Time', '01/01/2024  13:00'),
              const SizedBox(height: 20),
              // Location
              _buildInfoRow('Location', 'Hong Kong, China'),
              const SizedBox(height: 20),
              // Category
              _buildInfoRow('Category', 'Communication'),
              const SizedBox(height: 20), // Space before wallet logo
              Container(
                width: 300,
                height: 100,
                child: Image.asset("assets/images/wallet_logo_1.png"),
              ),
              const SizedBox(height: 20), // Space before Face ID button
              // Face ID Button
              Container(
                width: 300,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Continue with Face ID',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      height: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                height: 48,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Decline',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF69605),
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {Widget? rightElement}) {
    if (rightElement == null) {
      return Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 5), // Add space between title and value
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Lalezar',
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(
                      height: 5), // Add space between title and value
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Lalezar',
                    ),
                  ),
                ],
              ),
              rightElement,
            ],
          ));
    }
  }
}
