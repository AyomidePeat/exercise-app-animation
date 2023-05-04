import 'dart:async';

import 'package:exercise_app_animation/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  bool isPlayed = false;
  bool showBorder = false;
  bool isDone = false;
  int secs = 30;
  int millisecs = 59;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 17), (timer) {
      setState(() {
        if (millisecs <= 60 && millisecs != 0 && isPlayed !=false ) {
          millisecs--;
        }
        if (millisecs == 0 && secs <= 30 ) {
          isDone = true; if (secs>=1) {
            secs = secs - 1;
          }

          millisecs = 59;
          if (secs == 0 ) {
            timer.cancel();
           millisecs = 0;
          isPlayed = !isPlayed;
            
          }
        }
      });
    });
  }

  void startPlaying() {
    setState(() {
      isPlayed = !isPlayed;
      showBorder = true;
    });
    Timer(const Duration(milliseconds: 20), () {
      setState(() {
        showBorder = false;
        
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(top:true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                      children: [
                        SmallButton(onPressed: ()=>Navigator.pop(context),
                            color: Colors.white38, child: Icon(Icons.arrow_back)),
                        SmallButton(onPressed: (){},
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
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
            ).animate().slideY(begin:3, duration:400.ms),
            Expanded(
              child: CustomContainer(
                height:0,
                color: Colors.white,
                width: double.infinity,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Time left'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(secs < 10 ? '0$secs :' : '$secs :',
                            style: TextStyle(
                                color: isDone
                                    ? Colors.grey
                                    : Color.fromARGB(255, 229, 208, 208),
                                fontWeight: FontWeight.w400,
                                fontSize: 50)),
                        Text(millisecs < 10 ? '0$millisecs' : '$millisecs',
                            style: TextStyle(
                                color: isDone
                                    ? Color.fromARGB(255, 229, 208, 208)
                                    : Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 50))
                      ],
                    ).animate().fadeIn(delay: 2700.ms,duration: 500.ms),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('icons/x.svg')),
                        const SizedBox(width: 10),
                        BigButton(
                            color: const Color.fromARGB(255, 42, 27, 207),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: showBorder
                                      ? Border.all(width: 2, color: Colors.white)
                                      : null),
                              child: Center(
                                child: IconButton(
                                    icon: Icon(
                                        isPlayed ? Icons.stop : Icons.play_arrow),
                                    onPressed: () {
                                      startPlaying();
                                     startTimer();
                                    }),
                              ),
                            )),
                        const SizedBox(width: 10),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('icons/forward-step.svg')),
                      ],
                    ).animate().fadeIn(delay: 2500.ms,duration: 1000.ms),
                  ],
                )),
              ),
            ).animate().slideY(delay: 200.ms, begin:3, duration: 1000.ms),
          ],
        ),
      ),
    );
  }
}
