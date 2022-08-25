import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
 
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text:"Imen");
  final passwordController = TextEditingController(text:"Imen123");

  RxBool obscureText = true.obs;


  @override
  void onInit() {
    super.onInit();
  }

  viewPassWord() => obscureText.value = !obscureText.value;

  String  validatorEmail(String value){
    if(value.trim().isEmpty) {
      return "Please enter your email";
    }
    return null;
  }
  String  validatorPassword(String value){
    if(value.trim().isEmpty) {
      return "Please enter your password";
    }
    return null;
  }


  void navigateToCategory() {
    if(loginFormKey.currentState.validate()){
      Get.offAndToNamed(Routes.HOME);
    }
  }
}