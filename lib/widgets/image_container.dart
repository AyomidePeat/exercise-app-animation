import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double height;
  final String image;
  final Widget child;
  const ImageContainer({super.key, required this.height, required this.image, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
        height: height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image,),fit: BoxFit.cover,),
          
            
             borderRadius: BorderRadius.circular(20)),
        child: child);
  }
}
