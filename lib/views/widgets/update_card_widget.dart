import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/ExploreUpdate.dart';

class UpdateCardWidget extends StatelessWidget {
  final ExploreUpdate data;

  const UpdateCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 1 - Header
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: AppColor.primarySoft,
                    borderRadius: BorderRadius.circular(8),
                    image: data.logoUrl.isNotEmpty
                        ? DecorationImage(
                            image: AssetImage(data.logoUrl),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.storeName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: AppColor.secondary,
                        ),
                      ),
                      Text(
                        '72k Followers', // TODO: dynamic followers field later
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.secondary.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: add follow logic
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      fontSize: 12,
                    ),
                  ),
                  child: const Text("Follow"),
                ),
              ],
            ),
          ),

          // Section 2 - Image
          Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              color: AppColor.primarySoft,
              image: data.image.isNotEmpty
                  ? DecorationImage(
                      image: AssetImage(data.image),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),

          // Section 3 - Caption
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              data.caption,
              style: const TextStyle(height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
