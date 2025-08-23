import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Review.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ User Photo
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: AssetImage(review.photoUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ✅ Username - Rating - Comments
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username + Rating Row
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Username
                      Expanded(
                        child: Text(
                          review.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary,
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // Star Rating
                      SmoothStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        size: 16,
                        rating: review.rating,
                        color: Colors.orange,
                        borderColor: AppColor.primarySoft,
                        spacing: 1,
                      ),
                    ],
                  ),
                ),

                // Review Comment
                Text(
                  review.review,
                  style: TextStyle(
                    color: AppColor.secondary.withOpacity(0.7),
                    height: 1.4,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
