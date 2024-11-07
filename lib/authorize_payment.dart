import 'package:flutter/material.dart';
import 'package:ftec5510a_group11_frontend/countdown_timer.dart';
import 'package:ftec5510a_group11_frontend/payment_status.dart';
import 'package:local_auth/local_auth.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
              _buildInfoRow('Amount', '1000 HKD', rightElement: CountdownTimer()),
              const SizedBox(height: 20),
              _buildInfoRow('Merchant', 'CHINA MOBILE HONG KONG COMPANY LIMITED'),
              const SizedBox(height: 20),
              _buildInfoRow('Card Number', '1234 1234 1234 1234'),
              const SizedBox(height: 20),
              _buildInfoRow('Time', '01/01/2024  13:00'),
              const SizedBox(height: 20),
              _buildInfoRow('Location', 'Hong Kong, China'),
              const SizedBox(height: 20),
              _buildInfoRow('Category', 'Communication'),
              const SizedBox(height: 20),
              Container(
                width: 300,
                height: 100,
                child: Image.asset("assets/images/wallet_logo_1.png"),
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    // Perform Face ID authentication
                    final isAuthenticated = await _authenticateWithFaceID();
                    if (isAuthenticated) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const NextPage(isPaymentSuccessful: true),
                        ),
                      );
                    } else {
                      // Handle authentication failure
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Face ID authentication failed.'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Continue with Face ID',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const NextPage(isPaymentSuccessful: false)),
                  );
                },
                child: Container(
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
                  child: Center(
                    child: Text(
                      'Decline',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF69605),
                        fontSize: 16,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _authenticateWithFaceID() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
      );
      return didAuthenticate;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
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
            const SizedBox(height: 5),
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
                const SizedBox(height: 5),
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
        ),
      );
    }
  }
}
