import 'package:flutter/material.dart';
import 'package:marketky/core/model/explore_item.dart'; // file name lowercase rakho

class ExploreCardWidget extends StatelessWidget {
  final ExploreItem data;

  const ExploreCardWidget({
    Key? key,
    required this.data, // ✅ null-safety ke liye required use kiya
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // thoda light background rakha
        image: data.imageUrl.isNotEmpty
            ? DecorationImage(
                image: AssetImage(data.imageUrl), // ✅ string interpolation ki zarurat nahi
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: BorderRadius.circular(12), // thoda style add
      ),
    );
  }
}
