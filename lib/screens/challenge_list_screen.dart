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

class _ChallengeListScreenState extends State<ChallengeListScreen>
      {
  bool isDragged = false;
  bool isCardio = true;
  int currentIndex = 0;
 
  final List colors = [
    const Color.fromARGB(255, 195, 183, 183),
    const Color.fromARGB(255, 126, 126, 126),
    const Color.fromARGB(255, 184, 173, 173),
  ];
  final List images = [
    'images/abs.gif',
    'images/arms.gif',
    'images/leg.gif',
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
            preferredSize: Size.fromHeight(isCardio ? size.height * 0.71 : 100),
            child: AppBar(
                    backgroundColor: Colors.white,
                    flexibleSpace: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmallButton(
                                  onPressed: () => Navigator.pop(context),
                                  color: Colors.white,
                                  child: const Icon(Icons.arrow_back,
                                      color: Colors.black),
                                ),
                                const Text(
                                  'challenge',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 166, 156, 156)),
                                ),
                                SmallButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  child: Icon(Icons.more_horiz,
                                      color: Colors.black),
                                ),
                              ]),
                        ),
                        isCardio
                            ? ChallengeListContainer(
                                color: isCardio
                                    ? Colors.white
                                    : const Color.fromARGB(
                                        255, 126, 126, 126),
                                height: isCardio ? size.height * 0.63 : 70,
                                isDragged: isCardio,
                                child: const ChallengeContainer(
                                  image: 'images/card.gif',
                                  challenge: 'cardio',
                                  number: '1',
                                ))
                            : GestureDetector(
                            onTap: () => setState(() {
                                  isCardio = true;
                                  isDragged = false;
                                }),
                              child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                      const Text('1 / ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 207, 196, 196),
                                              fontSize: 23)),
                                      const Text(
                                        'cardio',
                                        style: TextStyle(fontSize: 23),
                                      ),
                                      SizedBox(width: size.width * 0.7)
                                    ]),
                            )
                      ],
                    ),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40)))
                .animate()
                .then(duration: 2000.ms)
                .slideY(duration: 2000.ms, curve: Curves.linear),
          ),
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
                    child: ChallengeListContainer(
                      color: isDragged && currentIndex == index
                          ? Color.fromARGB(255, 250, 236, 236)
                          : colors[index],
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
                                padding: const EdgeInsets.only(left: 2),
                                child: Text('${num.toString()} / ',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 89, 75, 75),
                                        fontSize: 23)),
                              ),
                              Text(
                                challenges[index],
                                style: const TextStyle(fontSize: 23),
                              )
                            ]),
                    ).animate().then(delay: 500.ms).slideY(
                        begin: 3,
                        duration: 1000.ms,
                        curve: Curves.easeInOutQuad));
              })),
    );
  }
}
