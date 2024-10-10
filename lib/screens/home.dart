import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/button.dart';
import '../components/food_popular.dart';
import '../components/food_tile.dart';
import '../models/shop.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';
import 'food_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // * Navigasi ke halaman item detail
  void navigationToFoodDetails(int index, {bool isPopular = false}) {
    final shop =
        Provider.of<Shop>(context, listen: false); // Mengambil Shop data
    final selectedFood = isPopular
        ? shop.popularMenu[index]
        : shop.foodMenu[index]; // Pilih makanan dari list yang benar

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetails(
          food: selectedFood, // Mengirim item makanan yang benar
          popularFood: selectedFood,
        ),
      ),
    );
  }

  // Animasi
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Inisialisasi animasi opacity
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Memulai animasi
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data dari Shop
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    final popularMenu = shop.popularMenu;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: FadeTransition(
        opacity: _animation,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 41),
              // * Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/icons/menu.png", width: 32),
                    Text(
                      "Tokyo",
                      style: blackBoldTextStyle.copyWith(fontSize: 18),
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          child: Image.asset(
                            "assets/icons/cart.png",
                            width: 32,
                          ),
                        ),
                        // * Menampilkan jumlah item di keranjang
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Consumer<Shop>(
                            builder: (context, shop, child) {
                              return Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    shop.cartItemCount
                                        .toString(), // Perbaikan di sini
                                    style: regularWhiteText.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              // * Promo
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                width: 330,
                height: 143,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Get 28% Promo",
                            style: whiteTitleText.copyWith(
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 24),
                          MyButton(
                            height: 46,
                            width: 116,
                            onPressed: () {},
                            text: "Redeem",
                          ),
                        ],
                      ),
                      Image.asset("assets/images/onigiri_rice_image.png",
                          width: 119, fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 26),
              // * Search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  style: regularBlackText.copyWith(fontSize: 14),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    filled: true,
                    fillColor: whiteColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 12,
                    ),
                    hintText: "Search",
                    hintStyle: lightGreyText.copyWith(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // * Food Menu
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Food Menu",
                  style: mediumBlackText.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 14),
              // * Food List
              SizedBox(
                height: 181, // Tinggi yang lebih besar untuk menampung konten
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) {
                    final food = foodMenu[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0
                            ? 30
                            : 15, // Margin kiri untuk item pertama
                        right: 15, // Margin kanan antar item
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width /
                            2.2, // Lebar lebih besar untuk tiap FoodTile
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: FoodTile(
                          food: food,
                          onTap: () => navigationToFoodDetails(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
              // * Popular Food
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Popular Food",
                  style: mediumBlackText.copyWith(fontSize: 16),
                ),
              ),
              // * Popular List
              Column(
                children: popularMenu.asMap().entries.map(
                  (entry) {
                    final popularFood = entry.value;
                    return PopularTile(
                      popular: popularFood,
                      onTap: () =>
                          navigationToFoodDetails(entry.key, isPopular: true),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
