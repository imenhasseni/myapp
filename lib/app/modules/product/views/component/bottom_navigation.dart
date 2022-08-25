import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Color color;
  final IconData icon;
  final void Function() onPressed;

  const BottomNavigation({Key key,  this.icon,  this.color, this.onPressed}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 25,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}