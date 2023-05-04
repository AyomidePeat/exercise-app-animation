import 'package:exercise_app_animation/screens/homescreen.dart';
import 'package:flutter/material.dart';

import '../screens/challenge_screen.dart';

class ChallengeContainer extends StatefulWidget {
  final String image;
  final String number;
  
  final String challenge;
  const ChallengeContainer({
    super.key,
    required this.image,
    required this.number,
    required this.challenge,
  
  });

  @override
  State<ChallengeContainer> createState() => _ChallengeContainerState();
}

class _ChallengeContainerState extends State<ChallengeContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FittedBox(
      fit: BoxFit.cover,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15.0, left: 5, right: 5, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Text('${widget.number} / ',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 172, 160, 160), fontSize: 27)),
              Text(
                '${widget.challenge}',
                style: const TextStyle(
                  fontSize: 27,
                  color: Colors.black,
                ),
              )
            ]),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(20),
              height: size.height * 0.45,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      widget.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30)),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 75,
              width: size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                             ChallengeScreen(image: widget.image),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    backgroundColor: const Color.fromARGB(255, 219, 255, 59),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'continue',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
