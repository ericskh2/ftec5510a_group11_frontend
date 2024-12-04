import 'package:flutter/material.dart';
import 'package:ftec5510a_group11_frontend/tickicon.dart';

import 'main.dart';

class NextPage extends StatefulWidget {
  final bool isPaymentSuccessful;
  final Map<String, dynamic> transaction;

  const NextPage({super.key, required this.isPaymentSuccessful, required this.transaction});

  @override
  _NextPageState createState() => _NextPageState();
}

List<String> _items = <String>['Food', 'Games', 'Education', 'Sports', 'Dress'];

class _NextPageState extends State<NextPage> {
  String? _selectedItem = _items[0]; // Initialize the selected item to the first item in the list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.isPaymentSuccessful ? 'Payment Successful' : 'Payment Failed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.isPaymentSuccessful ? Colors.green : Colors.red,
                  fontSize: 32,
                  fontFamily: 'Lalezar',
                  height: 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
                ),
              Container(
                width: widget.isPaymentSuccessful ? 300 : 200, // Set smaller size for cross
                height: widget.isPaymentSuccessful ? 100 : 50, // Adjust height proportionally
                child: Image.asset(
                  widget.isPaymentSuccessful ? "assets/images/tick.png" : "assets/images/cross.png",
                ),
              ),
              const SizedBox(height: 40),
              _buildInfoRow('Amount', '${widget.transaction['transaction_amount']} HKD'),
              const SizedBox(height: 20),
              _buildInfoRow('Merchant', '${widget.transaction['merchant']}'),
              const SizedBox(height: 20),
              _buildInfoRow('Card Number', '${widget.transaction['transaction_card_id']}'),
              const SizedBox(height: 20),
              _buildInfoRow('Time', '${widget.transaction['transaction_time']}'),
              const SizedBox(height: 20),
              _buildInfoRow('Location', '${widget.transaction['location']}'),
              const SizedBox(height: 20),
              _buildInfoRow('Category', '${widget.transaction['category']}'),
              const SizedBox(height: 20),
                            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WaitForPaymentPage()),
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
                      'Finish',
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
          ));
    }
  }
}

// Dropdown menu function
Widget buildDropdownMenu({
  required String? selectedItem,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return DropdownButton<String>(
    value: selectedItem,
    hint: const Text("Select an option"),
    items: items.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Row(
          children: [
            TickIconWithCircle(),
            const SizedBox(width: 8), // Add space between icon and text
            Text(value),
          ],
        ),
      );
    }).toList(),
    onChanged: onChanged,
    style: const TextStyle(color: Colors.black, fontSize: 16),
    dropdownColor: Colors.white,
    icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
    underline: Container(
      height: 2,
      color: Colors.blue,
    ),
  );
}
