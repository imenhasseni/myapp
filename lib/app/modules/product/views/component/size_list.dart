import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeList extends StatefulWidget {
  const SizeList({
    Key key,
  }) : super(key: key);

  @override
  _SizeListState createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {

  final List<String>sizeList =['S','M','L','XL','XXL'];
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        height: 60,
        width:  MediaQuery.of(context).size.width  * 0.7,
      padding: const EdgeInsets.only(top: 12, left: 70 ),   
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              setState(() {
                currentSelected = index;
              });
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(sizeList[index],
                    style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 15,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w400,
                            color: currentSelected == index ? Colors.red[400].withOpacity(0.7) : Colors.grey[800]
                          ),
                        ),
                ),
              ),
            ),
          ),
          separatorBuilder: (_,index)=> SizedBox(),
          itemCount: sizeList.length,     
          )
      );
 
  }
}
