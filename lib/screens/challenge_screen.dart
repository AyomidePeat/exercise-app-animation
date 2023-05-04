import 'package:exercise_app_animation/screens/homescreen.dart';
import 'package:exercise_app_animation/widgets/image_container.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  final String image;
  const ChallengeScreen({super.key, required this.image});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ImageContainer(
          height: size.height * 0.6,
          image: widget.image,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallButton(
                        child: Icon(Icons.arrow_back), color: Colors.white12),
                    SmallButton(
                        child: Icon(Icons.arrow_back), color: Colors.white12)
                  ],
                ),
              ),
              Align(alignment: Alignment.bottomCenter,
              )
            ],
          ),
        ),
      ],
    );
  }
}
