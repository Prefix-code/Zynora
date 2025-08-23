import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Search.dart';

class PopularSearchCard extends StatelessWidget {
  final PopularSearch data;
  final VoidCallback onTap;

  const PopularSearchCard({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // Image box
            Container(
              width: 46,
              height: 46,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: AppColor.primarySoft,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(data.imageUrl),
                  fit: BoxFit.cover, // ✅ better image scaling
                ),
              ),
            ),
            // Title
            Expanded(
              child: Text(
                data.title,
                maxLines: 1, // ✅ avoid overflow
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColor.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
