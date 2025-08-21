import 'package:flutter/material.dart';
import '../utils/app_helpers.dart';  // 👈 yaha import kiya
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final num price;
  final double rating;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    this.rating = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 6),

            /// INR Currency Format 👇
            Text(
              formatCurrency(price), // 👈 yaha use hua
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),

            const SizedBox(height: 8),

            /// Rating Widget 👇
            RatingWidget(
              rating: rating,
              onRatingUpdate: (val) {
                // Agar user rating karega to yaha value aayegi
                debugPrint("User ne diya rating: $val");
              },
            ),
          ],
        ),
      ),
    );
  }
}
