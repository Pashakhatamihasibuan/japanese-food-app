import 'item.dart'; // Import superclass Item

class FoodPopular extends Item {
  String name;
  double price;
  String imagePath;
  String rating;
  String icon;
  String description;

  // Constructor
  FoodPopular({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.icon,
    required this.description,
  });

  String get _name => name;

  double get _price => price;

  String get _imagePath => imagePath;

  String get _rating => rating;

  String get _description => description;

  // Properti icon untuk FoodPopular
  String get _icon => icon;
}
