import 'dart:convert';

Filtred filtredFromJson(String str) => Filtred.fromJson(json.decode(str));

class Filtred {
  Filtred({
     this.name,
  });

  String name;

  factory Filtred.fromJson(Map<String, dynamic> json) => Filtred(
        name: json["name"],
      );

  @override
  String toString() {
    return 'Category{name: $name}';
  }
}