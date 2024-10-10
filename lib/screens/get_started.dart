import 'package:flutter/material.dart';
import 'package:japanese_food/components/button.dart';
import 'package:japanese_food/themes/colors.dart';
import 'package:japanese_food/themes/fonts.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  // Variable to control the opacity
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Trigger the fade in animation when the page is loaded
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorMain,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Space
            const SizedBox(height: 50),

            // * Brand (Sushi Story Title with Fade In Animation)
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: Text(
                "SUSHI STORY",
                style: whiteTitleText.copyWith(fontSize: 36),
              ),
            ),

            // * Space
            const SizedBox(height: 16),

            // * Image (Fade In Animation)
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: Center(
                child: Image.asset(
                  "assets/images/onigiri_cute.png",
                  width: 326,
                  height: 331,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // * Space
            const SizedBox(height: 36),

            // * Title (Experience Japanese Cuisine with Fade In Animation)
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 3),
              child: Text(
                "EXPERIENCE JAPANESE CUISINE",
                style: whiteTitleText.copyWith(fontSize: 40),
              ),
            ),

            // * Space
            const SizedBox(height: 20),

            // * Subtitle (Fade In Animation)
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 4),
              child: Text(
                "Enjoy the authentic flavors of the most beloved Japanese dishes, anytime and anywhere.",
                style: regularWhiteText.copyWith(fontSize: 14),
              ),
            ),

            // * Space
            const SizedBox(height: 44),

            // * Get Started Button
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 3),
              child: MyButton(
                width: 330,
                height: 55,
                text: "Get Started",
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
