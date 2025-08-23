import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';

class MenuTileWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? subtitle; // ✅ null-safety
  final VoidCallback onTap; // ✅ Function ki jagah VoidCallback
  final EdgeInsetsGeometry? margin;
  final Color iconBackground;
  final Color titleColor;

  const MenuTileWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.margin,
    this.iconBackground = AppColor.primarySoft,
    this.titleColor = AppColor.secondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: double.infinity, // ✅ cleaner than MediaQuery
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.primarySoft,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            // 🔹 Icon Box
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon,
            ),

            // 🔹 Info Section
            Expanded(
              child: subtitle == null
                  ? Text(
                      title,
                      style: TextStyle(
                        color: titleColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: AppColor.secondary,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            color: AppColor.secondary.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
            ),

            // 🔹 Arrow Icon
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.border,
              size: 16, // ✅ thoda chhota aur neat
            ),
          ],
        ),
      ),
    );
  }
}
