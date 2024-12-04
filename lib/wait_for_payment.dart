import 'package:flutter/material.dart';

class WaitForPaymentPage extends StatelessWidget {
  const WaitForPaymentPage({super.key});

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
