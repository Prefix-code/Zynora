import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

/// Currency formatter (₹ INR)
String formatCurrency(num amount) {
  final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
  return format.format(amount);
}

/// Rating widget (can be reused anywhere)
class RatingWidget extends StatelessWidget {
  final double rating;
  final Function(double)? onRatingUpdate;

  const RatingWidget({
    Key? key,
    this.rating = 0,
    this.onRatingUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate ?? (value) {
        debugPrint("User Rating: $value");
      },
    );
  }
}
