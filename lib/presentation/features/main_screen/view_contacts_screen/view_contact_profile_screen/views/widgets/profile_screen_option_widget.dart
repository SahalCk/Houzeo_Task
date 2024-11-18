import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/colors.dart';

class ProfileScreenOptionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfileScreenOptionWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: lightThmePrimaryColor.withOpacity(0.2),
              radius: 28,
              child: Icon(icon, color: lightThemeTextColor, size: 29)),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
