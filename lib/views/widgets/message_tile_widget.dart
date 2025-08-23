import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Message.dart';
import 'package:marketky/views/screens/message_detail_page.dart';

class MessageTileWidget extends StatelessWidget {
  final Message data;

  const MessageTileWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MessageDetailPage(data: data),
          ),
        );
      },
      child: Container(
        width: double.infinity, // ✅ cleaner than MediaQuery
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: data.isReaded ? Colors.white : AppColor.primarySoft,
          border: Border(
            bottom: BorderSide(color: AppColor.primarySoft, width: 1),
          ),
        ),
        child: Row(
          children: [
            // 🔹 Shop Logo
            Container(
              width: 46,
              height: 46,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(data.shopLogoUrl),
                  fit: BoxFit.cover, // ✅ image crop avoid
                ),
              ),
            ),

            // 🔹 Shop Name & Message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.shopName,
                    style: const TextStyle(
                      color: AppColor.secondary,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.message,
                    maxLines: 1, // ✅ overflow prevent
                    overflow: TextOverflow.ellipsis,
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
