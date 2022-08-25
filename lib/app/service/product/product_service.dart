import 'dart:math';

import 'package:myapp/app/modules/product/models/product_model.dart';

class ProductService {
  Future<List<Product>> getAllProduct() async {
    List<Product> list = [];

    for (int index = 1; index <= 20; index++) {
      list.add(Product(
          name: "Article ${index}",
          mark:"Nice article",
          price: Random().nextInt(100).toDouble(),
          description:"Cool, weather is on its way.Send him  \n out the door in a article he wants to  \n wear.",
          image: "assets/product/img${index}.jpeg",
          selected: false));
    }
    return list;
  }
}