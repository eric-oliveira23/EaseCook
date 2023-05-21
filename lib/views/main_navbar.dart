import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'explore_page.dart';
import 'home_page/home_page.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    const HomePage(),
    const ExplorePage(),
    const Center(child: Text("2")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: const [
              Text(
                'EaseCook',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.redPrimary,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_add_outlined,
                      color: AppColors.redPrimary,
                    ),
                  )
                ],
              ),
            )
          ]),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: tabItems[_selectedIndex],
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            activeColor: AppColors.redPrimary,
          ),
          FlashyTabBarItem(
              icon: const Icon(Icons.explore_outlined),
              title: const Text('Explore'),
              activeColor: AppColors.redPrimary),
          FlashyTabBarItem(
            icon: const Icon(Icons.list_outlined),
            title: const Text('My Recipes'),
            activeColor: AppColors.redPrimary,
          ),
        ],
      ),
    );
  }
}
