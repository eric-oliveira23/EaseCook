import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SearchBarAnimation(
          textEditingController: searchController,
          isOriginalAnimation: true,
          trailingWidget: const Icon(Icons.abc),
          secondaryButtonWidget: const Icon(Icons.close),
          buttonWidget: const Icon(Icons.search),
        ),
      ]),
    );
  }
}
