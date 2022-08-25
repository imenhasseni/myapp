import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

class Product {
  Product({
     this.name,
     this.mark,
     this.price,
     this.description,
     this.image,
     this.selected,
  });

  String name;
  String mark;
  double price;
  String description;
  String image;
  bool selected;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        mark:json["mark"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        selected: json["selected"].obs,
      );
}