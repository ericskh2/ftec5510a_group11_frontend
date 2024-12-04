import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ftec5510a_group11_frontend/authorize_payment.dart';
import 'package:ftec5510a_group11_frontend/wait_for_payment.dart';

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
      home: const WaitForPaymentPage(),
    );
  }
}

class WaitForPaymentPage extends StatefulWidget {
  const WaitForPaymentPage({super.key});

  @override
  _WaitForPaymentPageState createState() => _WaitForPaymentPageState();
}

class _WaitForPaymentPageState extends State<WaitForPaymentPage> {
  final String userId = "0003";  // Replace with the actual user_id
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the periodic task
    _startReadingQueue();
  }

  void _startReadingQueue() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await _fetchVerificationQueue();
    });
  }

  Future<void> _fetchVerificationQueue() async {
    try {
      final response = await http.get(
        // For Android Emulator: 127.0.0.1 (localhost) refers to the emulator itself. To access your local machine's server, use the IP 10.0.2.2 (which is mapped to the host machine's 127.0.0.1).
        // Uri.parse('http://127.0.0.1:5000/readVerificationQueue?user_id=$userId'),
        Uri.parse('https://weekly-organic-wren.ngrok-free.app/readVerificationQueue?user_id=$userId'),
        headers: { 
          'Content-Type': 'application/json',  // Set the correct Content-Type
        },
      );

      if (response.statusCode == 200) {
        print('Response: ${response.body}');

        final responseData = jsonDecode(response.body);
        
        if(responseData['message'] == 'Transaction is fraud') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(transaction: responseData['transaction'],)),
          );

        }
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    // Stop the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waiting for Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            const Text('Waiting for payment to be processed...'),
          ],
        ),
      ),
    );
  }
}
