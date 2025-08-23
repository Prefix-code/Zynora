import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final int value;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onTap;

  const CustomIconButtonWidget({
    Key? key,
    required this.icon,
    required this.value,
    required this.onTap,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        margin: margin,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            // Background container with icon
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: icon,
            ),

            // Badge (only visible if value > 0)
            if (value > 0)
              Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.accent,
                ),
                child: Text(
                  '$value',
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
