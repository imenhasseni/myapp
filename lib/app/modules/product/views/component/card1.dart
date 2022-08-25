import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/modules/product/controllers/product_controller.dart';


class Card1 extends StatelessWidget {
  const Card1({
    Key key,
     this.controller,
     this.index,
  }) : super(key: key);

  final ProductController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(()=> InkWell(
      onTap: (){
        controller.selected.value = index;
      },
      child: Container( 
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
              color:  controller.selected.value == index
              ? Colors.red[400].withOpacity(0.7)
              : Colors.grey[200],
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: Text(
            controller.listGroup.value[index].name,
            style: GoogleFonts.montserrat(
              textStyle:  TextStyle(
                fontSize: 16,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                color:  controller.selected.value == index
                  ? Colors.white
                  : Colors.black,
              ),
            ),
          )
      ),
    )
    );
  }
}