import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Notification.dart';

class NotificationTile extends StatelessWidget {
  final VoidCallback onTap;
  final UserNotification data;

  const NotificationTile({
    Key? key,
    required this.onTap,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColor.primarySoft.withOpacity(0.2), // ✅ better feedback than GestureDetector
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: AppColor.primarySoft, width: 1), // ✅ subtle separation
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Image
            Container(
              width: 46,
              height: 46,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: AppColor.border,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(data.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 🔹 Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    data.title,
                    style: const TextStyle(
                      color: AppColor.secondary,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),

                  // Description
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 8),
                    child: Text(
                      data.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // ✅ prevent overflow
                      style: TextStyle(
                        color: AppColor.secondary.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ),

                  // DateTime row
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Time Circle.svg',
                        width: 14,
                        height: 14,
                        color: AppColor.secondary.withOpacity(0.7),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        data.dateTime,
                        style: TextStyle(
                          color: AppColor.secondary.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
