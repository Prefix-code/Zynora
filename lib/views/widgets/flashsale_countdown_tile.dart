import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';

class FlashsaleCountdownTile extends StatelessWidget {
  final String digit;

  const FlashsaleCountdownTile({
    Key? key,
    required this.digit, // ✅ null-safety
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4), // ✅ thoda smooth rounded
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // halka sa shadow
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          digit,
          style: const TextStyle(
            color: AppColor.primary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
