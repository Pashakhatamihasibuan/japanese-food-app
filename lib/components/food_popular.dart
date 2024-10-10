import 'package:flutter/material.dart';
import '../models/popular_food.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';

class PopularTile extends StatefulWidget {
  final FoodPopular popular;
  final void Function()? onTap;

  const PopularTile({
    Key? key,
    required this.popular,
    this.onTap,
  }) : super(key: key);

  @override
  State<PopularTile> createState() => _PopularTileState();
}

class _PopularTileState extends State<PopularTile> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 85,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(
          top: 14,
          left: 30,
          right: 30,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: Image.asset(
            widget.popular.imagePath,
            width: 65,
          ),
          title: Text(
            widget.popular.name,
            style: blackTitleText.copyWith(fontSize: 18),
          ),
          subtitle: Text(
            "\$${widget.popular.price.toStringAsFixed(2)}", // Memperbaiki referensi
            style: lightGreyText.copyWith(fontSize: 12),
          ),
          trailing: SizedBox(
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                  },
                  child: Image.asset(
                    isFavorited
                        ? 'assets/icons/favorite_solid.png'
                        : 'assets/icons/favorit_grey.png',
                    width: 24,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: yellowColor,
                      size: 12,
                    ),
                    SizedBox(width: 2),
                    Text(
                      widget.popular.rating,
                      style: lightGreyText.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
