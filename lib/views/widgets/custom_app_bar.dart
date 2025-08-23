import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback leftOnTap;
  final VoidCallback rightOnTap;
  final Widget leftIcon;
  final Widget rightIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    required this.leftOnTap,
    required this.rightOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 54,
        margin: const EdgeInsets.only(top: 14),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Button
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: leftOnTap,
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.primary,
                  backgroundColor: AppColor.primarySoft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.all(8),
                ),
                child: leftIcon,
              ),
            ),

            // Title
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.primarySoft,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis, // 🔑 title overflow fix
              ),
            ),

            // Right Button
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: rightOnTap,
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.primary,
                  backgroundColor: AppColor.primarySoft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.all(8),
                ),
                child: rightIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
