import 'package:flutter/material.dart';
import 'package:myapp/app/modules/onbording/models/onbording_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:myapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OnbordingController  extends GetxController{
  var selectedPageIndex = 0.obs; 
  bool get isLastPage => selectedPageIndex.value ==onbordingPages.length -1;
  var pageController = PageController();

forwardAction()
{
  if(isLastPage){
 //homepage
  Get.toNamed(Routes.LOGIN);
  } else
  pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease );
}
  
  List<OnbordingInfo> onbordingPages = [
    OnbordingInfo('assets/images/onbording1.png', 'Latest Outfit', 'There are many new outfits that make you cool.'),
    OnbordingInfo('assets/images/onbording2.png', 'Our Store', 'We help people conect with our store.'),
    OnbordingInfo('assets/images/onbording3.png', 'Stay At Home', 'We show theeasy way to shopjust stay at home.'),

  ];
  
}