import 'package:flutter/material.dart';

class DialPadDisplayWidget extends StatelessWidget {
  final String phoneNumber;
  final Function() onDeletePressed;
  const DialPadDisplayWidget(
      {super.key, required this.phoneNumber, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              phoneNumber.isEmpty ? "Enter number" : phoneNumber,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: onDeletePressed,
            icon: const Icon(Icons.backspace),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
