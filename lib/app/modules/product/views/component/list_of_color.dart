import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color-dot.dart';

class ListofColor extends StatelessWidget {
  const ListofColor({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Color",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              ColorDot(
                fillColor: Colors.green[200],
                isSelected: true,
              ),
              ColorDot(
                fillColor: Colors.red[200],
              ),
              ColorDot(
                fillColor: Colors.yellow[200],
              ),
            ],
          ),
        )
      ],
    );
  }
}
