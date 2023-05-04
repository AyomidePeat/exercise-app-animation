import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color color;
  const CustomContainer({super.key, required this.height, required this.child, required this.width, required this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      margin:EdgeInsets.only(top:2.0,bottom: 2.0),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: child);
  }
}
