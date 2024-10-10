import 'item.dart'; // Import superclass Item

class Food extends Item {
  String name;
  double price;
  String imagePath;
  String rating;
  String description;

  // Constructor
  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.description,
  });

  String get _name => name;

  double get _price => price;

  String get _imagePath => imagePath;

  String get _rating => rating;

  String get _description => description;
}
