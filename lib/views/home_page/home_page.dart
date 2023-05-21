import 'package:easecook/theme/colors.dart';
import 'package:flutter/material.dart';
import '../../components/area_tile.dart';
import 'home_binding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    setupHome();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(height: 15),
            const Text(
              'Just for you',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 8,
              child: Stack(
                children: [
                  Image.network(
                    'https://www.themealdb.com/images/category/dessert.png',
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    bottom: 12,
                    left: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '''I think this is a cake.''',
                          style: TextStyle(
                            color: AppColors.redPrimary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'A very important description for the cake.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Popular area recipes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            const AreaTile(areaTitle: 'Canada'),
            const SizedBox(height: 30),
            const AreaTile(areaTitle: 'Mexico'),
            const SizedBox(height: 30),
            const AreaTile(areaTitle: 'India'),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
