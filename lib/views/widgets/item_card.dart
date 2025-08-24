import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Product.dart';
import 'package:marketky/views/screens/product_detail.dart';
import 'package:marketky/views/widgets/rating_tag.dart';
import 'package:marketky/utils/currency_formatter.dart'; // ✅ use this

class ItemCard extends StatelessWidget {
  final Product product;
  final Color titleColor;
  final Color priceColor;

  const ItemCard({
    Key? key,
    required this.product,
    this.titleColor = Colors.black,
    this.priceColor = AppColor.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width / 2 - 16 - 8;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: product),
          ),
        );
      },
      child: Container(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Product Image
            Container(
              width: itemWidth,
              height: itemWidth,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(
                    product.image.isNotEmpty
                        ? product.image.first
                        : 'assets/images/placeholder.png', // ✅ Safe check
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: RatingTag(value: product.rating),
            ),

            // 📄 Product Details
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Product Price (₹ INR)
                  Text(
                    CurrencyFormatter.format(product.price), // ✅ Indian Rupee
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: priceColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
