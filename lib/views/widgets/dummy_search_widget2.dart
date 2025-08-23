import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import SearchPage
import 'package:your_app/views/widgets/search_page.dart';

// Import product model and dummy product list
import 'package:your_app/models/product_model.dart';
import 'package:your_app/data/dummy_products.dart';

class DummySearchWidget2 extends StatelessWidget {
  const DummySearchWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Jab user tap karega -> search page khulega
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(
                products: myProductList, // <-- yaha tumhari dummy product list
              ),
            ),
          );
        },
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: SvgPicture.asset(
                  'assets/icons/Search.svg',
                  color: Colors.white,
                  width: 18,
                  height: 18,
                ),
              ),
              Text(
                'Find a product...',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
