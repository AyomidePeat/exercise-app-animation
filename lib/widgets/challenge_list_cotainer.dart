import 'package:flutter/material.dart';

class ChallengeListContainer extends StatelessWidget {
  final Widget child;
 final double height;
  final bool isDragged;
  final Color color;
  const ChallengeListContainer({
    super.key,
    required this.child, required this.isDragged,required this.height, required this.color
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(duration: const Duration(milliseconds: 500),
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.only(left:2, right:2, top:20, bottom:10),
      width: size.width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)),
      child: child
    );
  }
}
