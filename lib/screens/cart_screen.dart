import 'package:flutter/material.dart';
import 'package:japanese_food/themes/colors.dart';
import 'package:japanese_food/themes/fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/popular_food.dart'; // Pastikan Anda mengimpor model yang benar
import '../models/shop.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // remove from cart
  void removeFromCart(BuildContext context, Shop shop, int index) {
    final foodItem = shop.cart[index].keys.first;
    shop.removeFromCart(foodItem);

    // Tampilkan snackbar sebagai umpan balik
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$foodItem has been removed from your cart.',
          style: regularWhiteText.copyWith(fontSize: 14),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showDeleteConfirmationDialog(
      BuildContext context, Shop shop, int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Lottie.asset(
            "assets/lottie_animations/warning.json",
            width: 123,
            height: 117,
          ),
          content: Padding(
            padding: const EdgeInsets.only(
              left: 52,
            ),
            child: Text(
              "Are you sure?",
              style: semiBoldBlackText.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 46,
                    width: 102,
                    decoration: BoxDecoration(
                      border: Border.all(color: lightPinkColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Tutup dialog
                      },
                      child: Text(
                        'Cancel',
                        style: mediumPinkText.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Container(
                    height: 46,
                    width: 102,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkPinkColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        removeFromCart(context, shop, index);
                        Navigator.of(context).pop(); // Tutup dialog
                      },
                      child: Text(
                        'Delete',
                        style: mediumWhiteText.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<Shop>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Image.asset(
                        "assets/icons/left_arrow.png",
                        width: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 97),
                    Text(
                      "My Cart",
                      style: blackBoldTextStyle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              // Menambahkan handle untuk cart kosong
              if (shop.cart.isEmpty)
                Center(
                  child: Text(
                    "Your cart is empty",
                    style: blackBoldTextStyle.copyWith(fontSize: 16),
                  ),
                )
              else
                SizedBox(
                  height: MediaQuery.of(context).size.height - 140,
                  child: ListView.builder(
                    itemCount: shop.cart.length,
                    itemBuilder: (context, index) {
                      final cartItem = shop.cart[index];

                      // Ambil item dan jumlah dari map
                      final item = cartItem
                          .keys.first; // Mengambil item (Food atau FoodPopular)
                      final quantity = cartItem.values.first;

                      // Mendapatkan nama, harga, dan gambar
                      String foodName = '';
                      double foodPrice = 0.0;
                      String imagePath = '';

                      if (item is Food) {
                        foodName = item.name;
                        foodPrice = item.price;
                        imagePath = item.imagePath;
                      } else if (item is FoodPopular) {
                        foodName = item.name;
                        foodPrice = item.price;
                        imagePath = item.imagePath;
                      } else {
                        return SizedBox
                            .shrink(); // Tidak tampilkan item jika tidak dikenali
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Image.asset(imagePath),
                            title: Text(
                              foodName,
                              style: blackTitleText.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price: \$${foodPrice.toStringAsFixed(2)}',
                                  style: lightGreyText.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Quantity: $quantity',
                                  style: regularBlackText.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            trailing: InkWell(
                              onTap: () {
                                showDeleteConfirmationDialog(
                                    context, shop, index);
                              },
                              child: Image.asset(
                                "assets/icons/delete.png",
                                width: 32,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
