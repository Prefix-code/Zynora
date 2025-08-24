import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Product.dart';
import 'package:marketky/views/screens/image_viewer.dart';
import 'package:marketky/views/screens/reviews_page.dart';
import 'package:marketky/views/widgets/custom_app_bar.dart';
import 'package:marketky/views/widgets/modals/add_to_cart_modal.dart';
import 'package:marketky/views/widgets/rating_tag.dart';
import 'package:marketky/views/widgets/review_tile.dart';
import 'package:marketky/views/widgets/selectable_circle_color.dart';
import 'package:marketky/views/widgets/selectable_circle_size.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart'; // ✅ INR format ke liye

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final PageController productImageSlider = PageController();

  /// ✅ INR formatter function
  String formatCurrency(num value) {
    final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
    return format.format(value);
  }

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: AppColor.border, width: 1),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.only(right: 14),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  'assets/icons/Chat.svg',
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return const AddToCartModal();
                      },
                    );
                  },
                  child: const Text(
                    'Add To Cart',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - appbar & product image
          Stack(
            alignment: Alignment.topCenter,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageViewer(imageUrl: product.image.first),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 310,
                  color: Colors.white,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: productImageSlider,
                    itemCount: product.image.length,
                    itemBuilder: (context, index) => Image.asset(
                      product.image[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              CustomAppBar(
                title: product.storeName,
                leftIcon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
                rightIcon: SvgPicture.asset(
                  'assets/icons/Bookmark.svg',
                  color: Colors.black.withOpacity(0.5),
                ),
                leftOnTap: () {
                  Navigator.of(context).pop();
                },
                rightOnTap: () {},
              ),
              Positioned(
                bottom: 16,
                child: SmoothPageIndicator(
                  controller: productImageSlider,
                  count: product.image.length,
                  effect: ExpandingDotsEffect(
                    dotColor: AppColor.primary.withOpacity(0.2),
                    activeDotColor: AppColor.primary,
                    dotHeight: 8,
                  ),
                ),
              ),
            ],
          ),
          // Section 2 - product info
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'poppins',
                          color: AppColor.secondary,
                        ),
                      ),
                    ),
                    RatingTag(
                      margin: const EdgeInsets.only(left: 10),
                      value: product.rating,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  formatCurrency(product.price), // ✅ INR me dikh raha hai
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'poppins',
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  product.description ??
                      'No description available for this product.',
                  style: TextStyle(
                    color: AppColor.secondary.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          // ✅ baki code same rahega (color picker, size picker, reviews, etc.)
        ],
      ),
    );
  }
}
