import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import '../theme/colors.dart';
import 'get_snackbar.dart';

class RecipeTile extends StatefulWidget {
  const RecipeTile({super.key});

  @override
  State<RecipeTile> createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> with TickerProviderStateMixin {
  bool _isBookmarkActive = false;
  late AnimationController _animationController;

  void _toggleBookmark() {
    setState(() {
      _isBookmarkActive = !_isBookmarkActive;

      if (_isBookmarkActive) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
    Get.snackbar(
      "Success!",
      "Item saved.",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(15),
      backgroundColor: Colors.black45,
      barBlur: 1.0,
      duration: const Duration(
        milliseconds: 1400,
      ),
    );
  }

  void _resetAnimation() {
    setState(() {
      _isBookmarkActive = false;
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _resetAnimation();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                stops: [0.5, 0.9],
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
        Positioned(
          right: 8,
          top: 8,
          child: GestureDetector(
            onTap: () => _toggleBookmark(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Lottie.asset(
                'assets/anim/bookmark.json',
                width: 40,
                height: 40,
                animate: _isBookmarkActive,
                repeat: false,
                controller: _animationController,
                onLoaded: (composition) {
                  _animationController.duration = composition.duration;
                },
              ),
            ),
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
