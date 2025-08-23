import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/views/screens/cart_page.dart';
import 'package:marketky/views/screens/message_page.dart';
import 'package:marketky/views/screens/search_page.dart';
import 'package:marketky/views/widgets/custom_icon_button_widget.dart';
import 'package:marketky/views/widgets/dummy_search_widget2.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int cartValue;
  final int chatValue;

  const MainAppBar({
    Key? key,
    required this.cartValue, // ✅ null-safety
    required this.chatValue,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.primary,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light, // ✅ moved up for clarity
      titleSpacing: 0, // ✅ better alignment
      title: Row(
        children: [
          // 🔍 Search Bar
          Expanded(
            child: DummySearchWidget2(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
            ),
          ),

          // 🛒 Cart Icon
          CustomIconButtonWidget(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            value: widget.cartValue,
            margin: const EdgeInsets.only(left: 16),
            icon: SvgPicture.asset(
              'assets/icons/Bag.svg',
              color: Colors.white,
            ),
          ),

          // 💬 Chat Icon
          CustomIconButtonWidget(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MessagePage()),
              );
            },
            value: widget.chatValue,
            margin: const EdgeInsets.only(left: 16),
            icon: SvgPicture.asset(
              'assets/icons/Chat.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
