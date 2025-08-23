import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Search.dart';
import 'package:marketky/core/services/SearchService.dart';
import 'package:marketky/views/screens/search_result_page.dart';
import 'package:marketky/views/widgets/popular_search_card.dart';
import 'package:marketky/views/widgets/search_history_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchHistory> listSearchHistory = SearchService.listSearchHistory;
  List<PopularSearch> listPopularSearch = SearchService.listPopularSearch;

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
        title: SizedBox(
          height: 40,
          child: TextField(
            autofocus: false,
            style: const TextStyle(fontSize: 14, color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
              hintText: 'Find a product...',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/icons/Search.svg',
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: Colors.white.withOpacity(0.1),
              filled: true,
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // 🔹 Section 1 - Search History
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Search history',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listSearchHistory.length,
                itemBuilder: (context, index) {
                  return SearchHistoryTile(
                    data: listSearchHistory[index],
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchResultPage(
                            searchKeyword: listSearchHistory[index].title,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      listSearchHistory.clear();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primarySoft,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    'Delete search history',
                    style: TextStyle(
                      color: AppColor.secondary.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 🔹 Section 2 - Popular Search
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Popular search',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  listPopularSearch.length,
                  (index) => PopularSearchCard(
                    data: listPopularSearch[index],
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchResultPage(
                            searchKeyword: listPopularSearch[index].title,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
