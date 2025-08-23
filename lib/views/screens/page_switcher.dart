import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/views/screens/feeds_page.dart';
import 'package:marketky/views/screens/home_page.dart';
import 'package:marketky/views/screens/notification_page.dart';
import 'package:marketky/views/screens/profile_page.dart';

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({super.key});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FeedsPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColor.primarySoft, width: 2),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex, // ✅ highlight active item
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 0
                    ? 'assets/icons/Home-active.svg'
                    : 'assets/icons/Home.svg',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 1
                    ? 'assets/icons/Category-active.svg'
                    : 'assets/icons/Category.svg',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 2
                    ? 'assets/icons/Notification-active.svg'
                    : 'assets/icons/Notification.svg',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 3
                    ? 'assets/icons/Profile-active.svg'
                    : 'assets/icons/Profile.svg',
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
