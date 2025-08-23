import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Product.dart';
import 'package:marketky/core/services/ProductService.dart';
import 'package:marketky/views/widgets/item_card.dart';

class SearchResultPage extends StatefulWidget {
  final String searchKeyword;

  const SearchResultPage({Key? key, required this.searchKeyword}) : super(key: key);

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> with TickerProviderStateMixin {
  late TabController tabController;
  final TextEditingController searchInputController = TextEditingController();
  final List<Product> searchedProductData = ProductService.searchedProductData;

  @override
  void initState() {
    super.initState();
    searchInputController.text = widget.searchKeyword;
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    searchInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: AppColor.primary,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            'assets/icons/Arrow-left.svg',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Add filter logic here
            },
            icon: SvgPicture.asset(
              'assets/icons/Filter.svg',
              color: Colors.white,
            ),
          ),
        ],
        title: Container(
          height: 40,
          child: TextField(
            controller: searchInputController,
            style: const TextStyle(fontSize: 14, color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.3)),
              hintText: 'Find a product...',
              prefixIcon: Container(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset('assets/icons/Search.svg', color: Colors.white),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: Colors.white.withOpacity(0.1),
              filled: true,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: AppColor.secondary,
            child: TabBar(
              controller: tabController,
              indicatorColor: AppColor.accent,
              indicatorWeight: 5,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'poppins',
                fontSize: 12,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'poppins',
                fontSize: 12,
              ),
              tabs: const [
                Tab(text: 'Related'),
                Tab(text: 'Newest'),
                Tab(text: 'Popular'),
                Tab(text: 'Best Seller'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // 1 - Related
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Search result of "${widget.searchKeyword}"',
                  style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: searchedProductData.isNotEmpty
                    ? Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: List.generate(
                          searchedProductData.length,
                          (index) => ItemCard(product: searchedProductData[index]),
                        ),
                      )
                    : const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "No products found.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          // 2 - Newest
          const Center(child: Text("Newest Products")),
          // 3 - Popular
          const Center(child: Text("Popular Products")),
          // 4 - Best Seller
          const Center(child: Text("Best Seller Products")),
        ],
      ),
    );
  }
}
