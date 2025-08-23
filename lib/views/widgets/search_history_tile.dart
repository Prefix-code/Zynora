import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Search.dart';

class SearchHistoryTile extends StatelessWidget {
  final SearchHistory data;
  final VoidCallback onTap; // ✅ Better callback type

  const SearchHistoryTile({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell( // ✅ Better touch feedback
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: AppColor.primarySoft,
              width: 1,
            ),
          ),
        ),
        child: Text(
          data.title,
          style: const TextStyle(
            fontSize: 14,
            color: AppColor.secondary,
            fontFamily: 'Poppins',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // ✅ Avoids text overflow
        ),
      ),
    );
  }
}
