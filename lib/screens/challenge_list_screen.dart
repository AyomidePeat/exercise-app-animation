import 'package:exercise_app_animation/widgets/challenge_list_cotainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/challenge_container.dart';
import 'homescreen.dart';

class ChallengeListScreen extends StatefulWidget {
  const ChallengeListScreen({super.key});

  @override
  State<ChallengeListScreen> createState() => _ChallengeListScreenState();
}

class _ChallengeListScreenState extends State<ChallengeListScreen> {
  bool isDragged = false;
  bool isCardio = true;
  int currentIndex = 0;
  final List colors = [
    const Color.fromARGB(255, 195, 183, 183),
    const Color.fromARGB(255, 126, 126, 126),
    Color.fromARGB(255, 184, 173, 173),
  ];
  final List images = [
    'images/bodytoning.gif',
    'images/deadbugs.gif',
    'images/lateralhops.gif',
  ];
  final List challenges = [
    'abs',
    'arms & back',
    'legs',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(isCardio ? size.height * 0.75 : 100),
            child: AppBar(
                backgroundColor: Color.fromARGB(255, 126, 126, 126),
                flexibleSpace: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SmallButton(
                              color: Colors.white,
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            ),
                            Text(
                              'challenge',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 207, 196, 196)),
                            ),
                            SmallButton(
                              color: Colors.white,
                              child:
                                  Icon(Icons.more_horiz, color: Colors.black),
                            ),
                          ]),
                    ),
                    GestureDetector(
                        onTap: () => setState(() {
                              isCardio = true;
                              isDragged = false;
                            }),
                        child: isCardio
                            ? ChallengeListContainer(
                                color: const Color.fromARGB(255, 126, 126, 126),
                                height: isCardio ? size.height * 0.63 : 70,
                                isDragged: isCardio,
                                child: const ChallengeContainer(
                                  image: 'images/core.gif',
                                  challenge: 'cardio',
                                  number: '1',
                                ))
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                    Text('1 / ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 207, 196, 196),
                                            fontSize: 23)),
                                    Text(
                                      'cardio',
                                      style: TextStyle(fontSize: 23),
                                    ),
                                    Expanded(child: SizedBox())
                                  ]))
                  ],
                ),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(40)))),
        body: ListView.builder(
            itemCount: challenges.length,
            itemBuilder: (context, index) {
              final num = index + 2;
            
            
              return GestureDetector(
                onVerticalDragUpdate: (value) {
                  setState(() {
                    isDragged = true;
                    isCardio = false;
                    currentIndex = index;
                
                  });
                },
                child: Align(
                  heightFactor:  0.7,
                  alignment: Alignment.topCenter,
                  child: ChallengeListContainer(
                    color: isDragged && currentIndex == index
                        ? Color.fromARGB(255, 250, 236, 236)
                        :  colors[index],
                    height: isDragged && currentIndex == index
                        ? size.height * 0.6
                        : 70,
                    isDragged: isDragged,
                    child: isDragged && currentIndex == index
                        ? ChallengeContainer(
                            image: images[index],
                            challenge: challenges[index],
                            number: num.toString(),
                          )
                        : Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only( left: 2),
                              child: Text('${num.toString()} / ',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 207, 196, 196),
                                      fontSize: 23)),
                            ),
                            Text(
                              challenges[index],
                              style: const TextStyle(fontSize: 23),
                            )
                          ]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
