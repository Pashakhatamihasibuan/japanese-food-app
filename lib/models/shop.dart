import 'package:flutter/material.dart';

import 'food.dart';
import 'item.dart';
import 'popular_food.dart';

class Shop extends ChangeNotifier {
  // Food Menu
  final List<Food> _foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: 25.00,
      imagePath: "assets/images/cute_sushi.png",
      rating: "4.8",
      description:
          "Salmon sushi is a traditional Japanese dish that combines fresh salmon with vinegared rice, creating a delightful and flavorful experience. The subtle sweetness of the fish paired with the light tanginess of the rice makes it a favorite choice for sushi lovers. Served with soy sauce, wasabi, or pickled ginger, it offers a variety of ways to enjoy each bite. Rich in protein and healthy fats, salmon sushi not only satisfies your taste buds but also provides essential nutrients. Whether for lunch, dinner, or a light snack, it remains a top option in Japanese cuisine.",
    ),
    Food(
      name: "Kebab",
      price: 17.00,
      imagePath: "assets/images/kebab.png",
      rating: "4.5",
      description:
          "Kebab is a delicious dish made from grilled or roasted pieces of meat, often served with pita bread or rice. The distinctive spice blend gives it a savory and rich flavor with every bite. Kebab meat typically consists of beef, chicken, or lamb, marinated to achieve a tender texture. This dish is often paired with yogurt sauce, fresh vegetables, and pickles for added taste. Besides being rich in protein, kebabs are also a good source of energy. Perfect for lunch, dinner, or a tasty snack, kebab remains a popular choice worldwide.",
    ),
  ];

  final List<FoodPopular> _popularMenu = [
    FoodPopular(
      name: "Rice Sushi",
      price: 21.00,
      rating: "4.7",
      imagePath: "assets/images/rice_sushi.png",
      icon: "assets/icons/favorit_grey.png",
      description:
          "Rice sushi is a traditional Japanese dish that combines vinegared rice with various toppings like fresh fish, vegetables, or eggs. The soft texture of the rice, along with its sweet and tangy flavor, creates a harmonious balance. This type of sushi offers versatility in its presentation, enjoyed with soy sauce, wasabi, or pickled ginger. In addition to its delicious taste, rice sushi is rich in nutrients like carbohydrates and proteins. Ideal for lunch, dinner, or a light snack, it always provides a satisfying and flavorful experience.",
    ),
    FoodPopular(
      name: "Ramen",
      price: 28.00,
      rating: "4.6",
      imagePath: "assets/images/ramen.png",
      icon: "assets/icons/favorit_grey.png",
      description:
          "Ramen is a Japanese noodle soup known for its savory and rich flavors. The umami-packed broth is made from meat or seafood stock, paired with chewy noodles, slices of meat, eggs, and vegetables. Each bowl of ramen offers a deeply satisfying experience, with various toppings that add texture and taste. In addition to being a treat for the taste buds, ramen contains a good balance of carbohydrates and proteins for energy. Perfect for a chilly day, this dish remains a popular staple in Japanese cuisine.",
    ),
  ];

  // Customer cart
  List<Map<Item, int>> _cart = [];

  // Method untuk menghitung total item di keranjang
  int get cartItemCount {
    return _cart.fold(0, (total, item) => total + item.values.first);
  }

  // Getter methods
  List<Food> get foodMenu => _foodMenu;
  List<FoodPopular> get popularMenu => _popularMenu;
  List<Map<Item, int>> get cart => _cart;

  // Add to cart - menerima Item
  void addToCart(Item item, int quantity) {
    // Cek jika item sudah ada di keranjang
    final existingItem = _cart.firstWhere(
      (cartItem) => cartItem.keys.first == item,
      orElse: () => {},
    );

    if (existingItem.isNotEmpty) {
      // Jika item sudah ada, tambahkan quantity
      existingItem[item] = (existingItem[item] ?? 0) + quantity;
    } else {
      // Jika item belum ada, tambahkan ke cart
      _cart.add({item: quantity});
    }

    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(Item item) {
    _cart.removeWhere((cartItem) => cartItem.containsKey(item));
    notifyListeners();
  }
}
