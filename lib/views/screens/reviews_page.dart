import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Review.dart';
import 'package:marketky/views/widgets/custom_app_bar.dart';
import 'package:marketky/views/widgets/review_tile.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ReviewsPage extends StatefulWidget {
  final List<Review> reviews;

  const ReviewsPage({required this.reviews, Key? key}) : super(key: key);

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  int _selectedTab = 0;

  double getAverageRating() {
    if (widget.reviews.isEmpty) return 0.0;
    double average = 0.0;
    for (var review in widget.reviews) {
      average += review.rating;
    }
    return average / widget.reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            title: 'Reviews',
            leftIcon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
            rightIcon: SvgPicture.asset(
              'assets/icons/Bookmark.svg',
              color: Colors.black.withOpacity(0.5),
            ),
            leftOnTap: () => Navigator.of(context).pop(),
            rightOnTap: () {},
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            // ⭐ Section 1 - Header
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Text(
                      getAverageRating().toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmoothStarRating(
                        allowHalfRating: true,
                        size: 28,
                        starCount: 5,
                        color: Colors.orange[400],
                        rating: getAverageRating(),
                        borderColor: AppColor.primarySoft,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Based on ${widget.reviews.length} Reviews',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // 📌 Section 2 - Tabs
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 16, bottom: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: List.generate(6, (index) {
                  return ElevatedButton(
                    onPressed: () => setState(() => _selectedTab = index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (_selectedTab == index) ? AppColor.primary : Colors.white,
                      foregroundColor: (_selectedTab == index) ? Colors.white : Colors.grey,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: AppColor.border, width: 1),
                      ),
                    ),
                    child: index == 0
                        ? const Text("All Reviews")
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Star-active.svg',
                                width: 14,
                                height: 14,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                child: Text("${index}★"),
                              ),
                            ],
                          ),
                  );
                }),
              ),
            ),

            // 📝 Section 3 - Review List
            IndexedStack(
              index: _selectedTab,
              children: [
                // All Reviews
                ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      ReviewTile(review: widget.reviews[index]),
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemCount: widget.reviews.length,
                ),
                // Star-based tabs (to filter later if needed)
                for (int i = 1; i <= 5; i++)
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    children: widget.reviews
                        .where((r) => r.rating == i)
                        .map((r) => ReviewTile(review: r))
                        .toList(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
