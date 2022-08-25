import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/product/controllers/product_controller.dart';


class CardProduct extends StatelessWidget {
  const CardProduct({
    Key key,
      this.controller,
      this.index,
  }) : super(key: key);
  final ProductController controller;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: index.isEven ? EdgeInsets.only(left: 10, top: 5, bottom:5) :  EdgeInsets.only(right: 10, top: 5, bottom: 5),
        width: 180,
        child: Column(
          children: [
            if(!index.isEven)
           SizedBox(height: 10),
            Hero(
              tag: "tag$index",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Stack(
                    children: [
                      Image.asset(
                          controller.listProduct.value[index].image,
                          width: 150,
                          height: 200,
                          fit: BoxFit.cover
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:  BorderRadius.all(Radius.circular(20))
                          ),
                          child: Obx(()=> IconButton(
                            padding: EdgeInsets.zero,
                            icon: Center(
                            child: Icon(Icons.favorite, color: controller.listProduct.value[index].selected ? Colors.red : Colors.grey, size: 20,),
                            ), onPressed: () {
                            controller.listProduct[index].selected =
                            !controller.listProduct[index].selected;
                            controller.listProduct.value = [...controller.listProduct.value];
                          },
                          ),
                          )
                        ),
                      )
                    ],
                  ),
                ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.listProduct.value[index].name, style: GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),),
                  const SizedBox(height: 2,),
                  Text("\$"+controller.listProduct.value[index].price.toStringAsFixed(2), style: GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color:  Colors.amber,
                    ),
                  ),),
                ],
              ),
            ),
          ],
        )
    );
  }
}