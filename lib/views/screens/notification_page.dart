import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Notification.dart';
import 'package:marketky/core/services/NotificationService.dart';
import 'package:marketky/views/widgets/main_app_bar_widget.dart';
import 'package:marketky/views/widgets/menu_tile_widget.dart';
import 'package:marketky/views/widgets/notification_tile.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<UserNotification> listNotification = NotificationService.listNotification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
        cartValue: 2,
        chatValue: 2,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // 🔹 Section 1 - Menu
          MenuTileWidget(
            onTap: () {},
            icon: SvgPicture.asset(
              'assets/icons/Discount.svg',
              color: AppColor.secondary.withOpacity(0.6),
            ),
            title: 'Product Promo',
            subtitle: 'Get the latest deals and discounts!',
          ),
          MenuTileWidget(
            onTap: () {},
            icon: SvgPicture.asset(
              'assets/icons/Info Square.svg',
              color: AppColor.secondary.withOpacity(0.6),
            ),
            title: 'Marketky Info',
            subtitle: 'Important updates & news',
          ),

          // 🔹 Section 2 - Orders Status
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    'ORDERS STATUS',
                    style: TextStyle(
                      color: AppColor.secondary.withOpacity(0.6),
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                // Notification List
                ListView.builder(
                  itemCount: listNotification.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NotificationTile(
                      data: listNotification[index],
                      onTap: () {
                        // TODO: Implement notification details navigation
                      },
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
