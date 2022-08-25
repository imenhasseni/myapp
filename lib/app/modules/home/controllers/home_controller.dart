import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:myapp/app/routes/app_pages.dart';
import 'package:myapp/app/service/category/category_service.dart';


class HomeController extends GetxController {
 final CategoryService apiService = CategoryService();

  RxList listGategory = List.empty(growable: true).obs;

  @override
  void onInit() {
    getAllCategory();
    super.onInit();
  }

  Future<void> getAllCategory() async {
   
      listGategory.value = await apiService.getAllCategory();
   
  }

  void navigateToProduct() {
    Get.toNamed(Routes.PRODUCT);
  }
}