import 'package:exercise_app_animation/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/big_button.dart';
import '../widgets/custom_container.dart';

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
    return Scaffold(backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: size.height * 0.7,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.image,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SmallButton(
                          color: Colors.white38, child: Icon(Icons.arrow_back)),
                      SmallButton(
                          color: Colors.white38, child: Icon(Icons.more_horiz))
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        // margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                        height: 150,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '6',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: '/7',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  '3 x 15',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            Text('dumbbell to the chest',
                                style: TextStyle(
                                    fontSize: size.width / 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            const Text(
                              'Hold the dumbbell straight, put your arm behing your back, feel the tension on your back ',
                              overflow: TextOverflow.fade,
                            )
                          ],
                        )))
              ],
            ),
          ), 
          Expanded(
            child: CustomContainer(
              height: size.height * 0.28,
              color: Colors.white,
              width: double.infinity,
              child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Scored Time'),
                  Text('24:37',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 50)),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('icons/x.svg')),
                          const SizedBox(width:10),
                      BigButton(
                          color: const Color.fromARGB(255, 42, 27, 207),
                          child: AnimatedContainer(duration:const Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                 shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 2, color: Colors.white)),
                              child: Center(
                                child: IconButton(
                                    icon: SvgPicture.asset('icons/play.svg', color: Colors.white,fit:BoxFit.contain),
                                    onPressed: () {}),
                              ))),const SizedBox(width:10),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('icons/forward-step.svg')),
                    ],
                  ),
                  ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
