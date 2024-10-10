import 'package:flutter/material.dart';
import 'package:japanese_food/models/shop.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';
import 'button.dart';

class BottomNav extends StatefulWidget {
  final dynamic food; // Gunakan dynamic untuk menerima Food dan FoodPopular
  final dynamic popularFood;

  const BottomNav({
    super.key,
    required this.food,
    required this.popularFood,
  });

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  void addToCart() {
    if (quantity > 0) {
      final shop = context.read<Shop>();

      final selectedFood = widget.popularFood ?? widget.food;

      // Menambahkan ke keranjang
      shop.addToCart(
        selectedFood,
        quantity,
      );

      // Menampilkan dialog setelah berhasil menambahkan ke keranjang
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Lottie.asset(
              "assets/lottie_animations/successfully-send.json",
              width: 123,
              height: 117,
            ),
            content: Text(
              "Successfully added to Cart",
              style: semiBoldBlackText.copyWith(
                fontSize: 18,
              ),
            ),
            actions: [
              Center(
                child: Container(
                  height: 46,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkPinkColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                    },
                    child: Text(
                      'OK',
                      style: mediumWhiteText.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 30,
          ),
          height: 140,
          width: double.infinity,
          color: lightPinkColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.food.price.toStringAsFixed(2)}', // Memastikan harga ditampilkan dengan 2 desimal
                    style: semiBoldWhiteText.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: decrementQuantity,
                        child: Image.asset(
                          "assets/icons/remove.png",
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        quantity.toString(),
                        style: semiBoldWhiteText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: incrementQuantity,
                        child: Image.asset(
                          "assets/icons/add.png",
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 27),
              MyButton(
                text: "Add To Cart",
                height: 50,
                width: 330,
                onPressed: addToCart,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
