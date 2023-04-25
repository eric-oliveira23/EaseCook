import 'package:easecook/views/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../theme/colors.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> with TickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

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
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["Home", "Explore", "My Recipes", "Profile"],
        icons: const [
          Icons.home_outlined,
          Icons.explore_outlined,
          Icons.list_alt_outlined,
          Icons.person_outlined
        ],

        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.redPrimary,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: AppColors.redPrimary,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: AppColors.redPrimary,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,

        children: const [
          Center(
            child: Text("Home"),
          ),
          Center(
            child: ExplorePage(),
          ),
          Center(
            child: Text("My Recipes"),
          ),
          Center(
            child: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
