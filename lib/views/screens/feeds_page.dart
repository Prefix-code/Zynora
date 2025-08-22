import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/ExploreItem.dart';
import 'package:marketky/core/model/ExploreUpdate.dart';
import 'package:marketky/core/services/ExploreService.dart';
import 'package:marketky/views/widgets/explore_card_widget.dart';
import 'package:marketky/views/widgets/main_app_bar_widget.dart';
import 'package:marketky/views/widgets/update_card_widget.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> with TickerProviderStateMixin {
  late TabController tabController;
  final List<ExploreItem> listExploreItem = ExploreService.listExploreItem;
  final List<ExploreUpdate> listExploreUpdateItem = ExploreService.listExploreUpdateItem;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        cartValue: 2,
        chatValue: 2,
      ),
      body: Column(
        children: [
          // TabBar
          Container(
            width: double.infinity,
            height: 60,
            color: AppColor.secondary,
            child: TabBar(
              controller: tabController,
              indicatorColor: AppColor.accent,
              indicatorWeight: 4,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              tabs: const [
                Tab(text: 'Update'),
                Tab(text: 'Explore'),
              ],
            ),
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const BouncingScrollPhysics(),
              children: [
                // Tab 1 - Update
                ListView.separated(
                  itemCount: listExploreUpdateItem.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return UpdateCardWidget(
                      data: listExploreUpdateItem[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                ),

                // Tab 2 - Explore
                GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: listExploreItem.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return ExploreCardWidget(
                      data: listExploreItem[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
