

import 'package:myapp/app/modules/home/models/category_model.dart';

class CategoryService{
  Future<List<Category>> getAllCategory() async {

    List<Category> listCategory=[];
    listCategory.add(Category(name: "Jacket", image: "assets/category/varsity-jacket.png",selected:false));
    listCategory.add(Category(name: "Handbag", image: "assets/category/handbag.png",selected:false));
    listCategory.add(Category(name: "Spectacle", image: "assets/category/sunglasses.png",selected:false));
    listCategory.add(Category(name: "Kimono", image: "assets/category/kimono.png",selected:false));
    listCategory.add(Category(name: "Gloves", image: "assets/category/winter-gloves.png",selected:false));
    listCategory.add(Category(name: "Lab Coat", image: "assets/category/lab-coat.png",selected:false));
    listCategory.add(Category(name: "Dress", image: "assets/category/dress.png",selected:false));
    listCategory.add(Category(name: "Flat Shoes", image: "assets/category/sneakers.png",selected:false));
    listCategory.add(Category(name: "Jeans", image: "assets/category/jeans.png",selected:false));
    listCategory.add(Category(name: "Necktie", image: "assets/category/necktie.png",selected:false));
    return listCategory;

  }
}