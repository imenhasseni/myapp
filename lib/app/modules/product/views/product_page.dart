import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/modules/product/controllers/product_controller.dart';
import 'package:myapp/app/modules/product/views/component/bottom_navigation.dart';
import 'package:myapp/app/modules/product/views/details_product.dart';

import 'component/card.dart';
import 'component/card1.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 50.0),
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.grey[200],
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.grey[200],
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey[200])),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "Find your product",
                      prefixIcon: Icon(Icons.search,
                          color: Colors.red[400].withOpacity(0.7)),
                    ),
                    cursorColor: Colors.grey[200],
                  ),
                ),
                SizedBox(width: 20),
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        
                        ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none_rounded,
                            color: Colors.red[400].withOpacity(0.7))))
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: size.width * 0.4,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.orange[100].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                       boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0, 4),
                                  blurRadius: 5
                                )
                              ]
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        left: 20,
                        child: Image.asset("assets/icons/fast-delivery.png",
                            height: 120),
                      ),
                      Positioned(
                          top: 65,
                          left: 180,
                          child: Text(
                            'Free Shipping \n During Covid-19',
                             textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[400].withOpacity(0.7)
                              ),
                            ),
                          )),
                    ],
                  )),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 10, top: 8),
                  child: SizedBox(
                    height: 60,
                    child: ListView.builder(
                      itemCount: controller.listGroup.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card1(
                            controller: controller,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 100 / 150,
                      physics:  NeverScrollableScrollPhysics(),
                      children:
                          List.generate(controller.listProduct.length, (index) {
                        return GestureDetector(
                onTap: () {
                  Get.off( DetailPage(index: index,), arguments: controller.listProduct.value[index].name);
                },
                          child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: CardProduct(
                                controller: controller,
                                index: index,
                              ),
                          ),
                        );
                      }),
                    ),
                  ))
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            backgroundColor: Colors.red[400].withOpacity(0.7),
            child:
                Image.asset("assets/icons/scanning.png", height: 20, width: 20),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          notchMargin: 10,
          child: Container(
            height: 35,
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BottomNavigation(
                      icon: Icons.home,
                      color: Colors.red[400].withOpacity(0.7),
                      onPressed: () {},
                    ),
                    BottomNavigation(
                      icon: Icons.local_grocery_store_rounded,
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BottomNavigation(
                      icon: Icons.favorite,
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                    BottomNavigation(
                      icon: Icons.person_rounded,
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
