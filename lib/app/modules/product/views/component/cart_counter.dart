import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({ Key key }) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove, 
          press: (){
            if(numOfItems > 1){
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Text(numOfItems.toString().padLeft(2,"0"),
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 15,
                letterSpacing: 1,
                fontWeight: FontWeight.w300,
                color: Colors.grey[800],
              ),
            ),),
        ),
         buildOutlineButton(
          icon: Icons.add, 
          press: (){
            setState(() {
              numOfItems++;
            });
          },
        ),
      ],
      
    );
  }

  Padding buildOutlineButton({IconData icon, Function press}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(13) ),
            onPressed: press,
            child: Icon(icon, size: 15,),
          ),
        ),
    );
  }
}



