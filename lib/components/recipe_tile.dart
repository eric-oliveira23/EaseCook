import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme/colors.dart';

class RecipeTile extends StatefulWidget {
  const RecipeTile({super.key});

  @override
  State<RecipeTile> createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                ],
                stops: [0.7, 1.0],
              ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            blendMode: BlendMode.darken,
            child: Image.network(
                width: 200,
                height: 280,
                fit: BoxFit.cover,
                'https://themealdb.com/images/media/meals/yyrrxr1511816289.jpg'),
          ),
        ),
        const Positioned(
          right: 12,
          top: 12,
          child: Icon(
            Icons.bookmark,
            color: AppColors.redPrimary,
          ),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '''I think this is a cake.''',
                style: TextStyle(
                  color: AppColors.redPrimary,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'A very important description',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
