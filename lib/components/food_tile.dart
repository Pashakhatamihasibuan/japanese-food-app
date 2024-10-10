import 'package:flutter/material.dart';

import '../models/food.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  FoodTile({
    Key? key,
    required this.food,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12), // Kurangi padding untuk ruang lebih
        width: MediaQuery.of(context).size.width / 2 -
            40, // Atur lebar berdasarkan kolom
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              food.imagePath,
              width: 80, // Sesuaikan lebar gambar
              height: 80, // Sesuaikan tinggi gambar agar proporsional
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              food.name,
              style: blackTitleText.copyWith(fontSize: 14),
              maxLines: 1, // Batasi jumlah baris untuk menghindari overflow
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${food.price.toStringAsFixed(2)}",
                  style: lightGreyText.copyWith(fontSize: 12),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: yellowColor,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      food.rating,
                      style: lightGreyText.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
