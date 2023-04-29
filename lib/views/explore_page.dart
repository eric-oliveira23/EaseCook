import 'dart:math';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();

  List randomRecipesList = [
    'Honey Teriyaki Salmon',
    'Bean & Sausage Hotpot',
    'Chocolate Avocado Mousse',
    'Croatian Bean Stew',
    'Boxty Breakfast',
    'Moussaka',
    'Cream Cheese Tart',
    'Blackberry Fool',
    'Chicken Marengo',
    'Kumpir',
  ];

  late String randomRecipe;

  @override
  void initState() {
    randomRecipe = getRandomRecipe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: randomRecipe,
                labelText: 'Search recipes',
                labelStyle: const TextStyle(fontSize: 20),
                prefixIcon: const Icon(Icons.search),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
              ),
            )),
      ]),
    );
  }

  String getRandomRecipe() {
    Random random = Random();
    int randomIndex = random.nextInt(9);

    randomRecipe = 'Suggestion: ';

    setState(() {
      randomRecipe += randomRecipesList[randomIndex];
    });

    return randomRecipe;
  }
}
