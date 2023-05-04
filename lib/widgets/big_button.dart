import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final Color color;
  final Widget child;
  const BigButton({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
   return SizedBox(
      height: 90,
      width: 90,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: color),
          child: child),
    );
  }
}
