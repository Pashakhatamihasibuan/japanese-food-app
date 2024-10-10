import 'package:flutter/material.dart';
import 'package:japanese_food/components/bottom_details.dart';
import 'package:japanese_food/themes/colors.dart';
import 'package:japanese_food/themes/fonts.dart';

class FoodDetails extends StatelessWidget {
  final dynamic food;
  final dynamic popularFood;

  const FoodDetails({
    super.key,
    required this.food,
    required this.popularFood,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNav(
        food: food,
        popularFood: popularFood,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 38,
                  left: 30,
                  right: 30,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Image.asset(
                    "assets/icons/left_arrow.png",
                    width: 32,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  food.imagePath,
                  width: 222,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: yellowColor,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      food.rating,
                      style: lightGreyText.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: blackTitleText.copyWith(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "\$${food.price.toStringAsFixed(2)}",
                      style: lightGreyText.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Other details
                    Text(
                      "Description",
                      style: mediumBlackText.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      food?.description ?? 'No description available',
                      style: regularBlackText.copyWith(
                        fontSize: 14,
                        height: 26 / 14,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
