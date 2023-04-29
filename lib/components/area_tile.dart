import 'package:easecook/components/recipe_tile.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AreaTile extends StatefulWidget {
  final String areaTitle;
  const AreaTile({super.key, required this.areaTitle});

  @override
  State<AreaTile> createState() => _AreaTileState();
}

class _AreaTileState extends State<AreaTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.areaTitle,
          style: const TextStyle(
            color: AppColors.redPrimary,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 280,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: const [
              RecipeTile(),
              RecipeTile(),
              RecipeTile(),
              RecipeTile(),
            ],
          ),
        ),
      ],
    );
  }
}
