
import 'package:get/get.dart';
import 'package:myapp/app/service/filter/filter_service.dart';
import 'package:myapp/app/service/product/product_service.dart';

class ProductController extends GetxController {
  final FiltredService _filtredService = FiltredService();
  final ProductService apiService = ProductService();

  RxList listGroup = List.empty(growable: true).obs;
  RxList listProduct = List.empty(growable: true).obs;
  RxInt selected = (-1).obs;

  @override
  void onInit() {
    getAllFiltred();
    getAllCategory();
    super.onInit();
  }

  Future<void> getAllFiltred() async {
    listGroup.value = await _filtredService.getAllFiltred();
  }

  Future<void> getAllCategory() async {
      listProduct.value = await apiService.getAllProduct();
  }

  
}