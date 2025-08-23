import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import karo product list aur search page
import 'package:your_app/data/dummy_products.dart';  
import 'package:your_app/views/widgets/search_page.dart';

class DummySearchWidget1 extends StatelessWidget {
  const DummySearchWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ✅ Navigation to SearchPage with product list
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchPage(
              products: myProductList, // dummy_products.dart wali list
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
                color: Colors.black,
                width: 18,
                height: 18,
              ),
            ),
            const Text(
              'Find a product...',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
