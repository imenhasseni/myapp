import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/modules/product/controllers/product_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

import 'component/cart_counter.dart';
import 'component/list_of_color.dart';
import 'component/size_list.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key key,
    this.index,
  }) : super(key: key);

  final ProductController controller = Get.put(ProductController());
  final int index;
  bool isButtonNotClickable= false;

  void ButtonFunction (){
     isButtonNotClickable = true;
     print("Clicked");
  }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    print(data);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getAllCategory();
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, -4),
                      blurRadius: 8)
                ],
                image: DecorationImage(
                  image: AssetImage(
                    controller.listProduct.value[index].image,
                  ),
                  fit: BoxFit.cover,
                )),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, -2),
                                blurRadius: 8)
                          ]),
                      child: IconButton(
                        padding: EdgeInsets.only(left: 4),
                        icon: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey[800],
                            size: 15,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.PRODUCT);
                        },
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, -2),
                                blurRadius: 8)
                          ]),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Center(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                        onPressed: () {
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 30.0),
                        child: Text(
                          controller.listProduct.value[index].name,
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                        child: Text(controller.listProduct.value[index].mark,
                            style: GoogleFonts.ptSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[800])),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0, top: 40),
                        child: Text(
                          "\$" +
                              controller.listProduct.value[index].price
                                  .toStringAsFixed(2),
                          style: GoogleFonts.ptSans(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[400].withOpacity(0.7)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 580,
            left: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ),
          Positioned(
            top: 640,
            left: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.listProduct.value[index].description,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 745.0,
            left: 40,
            child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_rounded,
                        color: Colors.red[400].withOpacity(0.7)))),
          ),
          Positioned(
            top: 745,
            left: 115.0,
            child: SizedBox(
              width: 250,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  bottomsheets(context);
                },
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[400].withOpacity(0.7),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void bottomsheets(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                     Padding(
                  padding: const EdgeInsets.only(left:47.0),
                  child: Text(
                    "Size",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ), 
               SizeList()
            ],), 
            ListofColor(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Total",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
                CartCounter(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:55.0,top: 10),
                  child: Text("Total Paymenet",  
                   style: GoogleFonts.ptSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]),),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text( "\$" +
                                controller.listProduct.value[index].price
                                    .toStringAsFixed(2),  
                                     style: GoogleFonts.ptSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[400].withOpacity(0.7)),),
                )
              ],
            ),
          SizedBox(height: 10,),
           SizedBox(
             width: 250,
              height: 55,
             child: Opacity(
              opacity: isButtonNotClickable ? 0.0  : 0.3 ,
               child: ElevatedButton(
                    onPressed: (){
                      if(isButtonNotClickable){
                        ButtonFunction();
                      }
                    } ,
                    child: Text(
                      'checkout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color:  Colors.white ,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[400].withOpacity(0.7),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}

