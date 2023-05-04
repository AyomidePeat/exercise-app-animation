import 'package:exercise_app_animation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/image_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor:Colors.transparent,// Color.fromARGB(31, 179, 140, 140),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: AppBar(
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20, right: 20, bottom: 20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                SizedBox(
                                    width: 50,
                                    child: ImageContainer(
                                      height: 50,
                                      child: Text(''),
                                      image: 'images/lady1.jpg',
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('hello / ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17)),
                                Text(
                                  'Ayomide',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                            SmallButton(
                                color: Colors.white,
                                child: SvgPicture.asset('icons/bell.svg'))
                          ],
                        ),
                      ),
                    ),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40)))
                .animate()
                .then(duration: 2000.ms)
                .slideY(duration: 2000.ms),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 2,
              ),
              ImageContainer(
                  height: size.height * 0.5,
                  image: 'images/lady6.jpg',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('ready. steady. go!',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('you have a new challenge for this week',
                              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
                        ],
                      )
                          .animate()
                          .then(duration: 2000.ms)
                          .slideY(begin: -2, duration: 1000.ms)
                          .then(duration: 100.ms)
                          .fadeIn(duration: 1000.ms),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          const SmallButton(
                            color: Color.fromARGB(255, 219, 255, 59),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ).animate().then(delay: 4000.ms).fadeIn(duration:2000.ms),
                        ],
                      )
                    ],
                  )).animate().slideY(duration: 1500.ms),
              CustomContainer(
                  height: 100,
                  width: size.width,
                  color: Color.fromARGB(255, 42, 27, 207),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: '724 ',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: 'kcal',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w300))
                          ])),
                          const Text('more',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text('Your Activity',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w200))
                    ],
                  )).animate().then(delay: 1000.ms).slideY(begin:3, duration:2000.ms),
              SizedBox(height:168,
                child: Stack(alignment: Alignment.bottomCenter,fit: StackFit.expand,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomContainer(
                            color: Color.fromARGB(255, 212, 202, 202),
                            height: 90,
                            width: size.width / 3.035,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '4.902',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'steps',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            )),
                        const SizedBox(width: 2),
                        CustomContainer(
                            color: Color.fromARGB(255, 212, 202, 202),
                            height: 90,
                            width: size.width / 3.035,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '3.45km',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'distance',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            )),
                        const SizedBox(width: 2),
                        CustomContainer(
                            color: Color.fromARGB(255, 212, 202, 202),
                            height: 90,
                            width: size.width / 3.035,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '03:45',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'walking time',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                             )),
                      ],
                    ),
                             Positioned(top:65, bottom: 2,
                 child: Container(width:size.width,
                     padding: const EdgeInsets.all(20),
                     margin:const EdgeInsets.only(top:2.0,bottom: 2.0),
                       height: 100,
                       
                       decoration: BoxDecoration(
                         color:Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                       child: Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                             SvgPicture.asset('icons/grid.svg', color:const Color.fromARGB(255, 42, 27, 207),).animate() .then(delay: 4000.ms).rotate( duration:1000.ms).fadeIn(duration:2000.ms),
                             const Padding(
                               padding: EdgeInsets.only(bottom:10.0),
                               child: Icon(Icons.star_border_outlined, color:Colors.black, size:22),
                             ).animate() .then(delay: 4000.ms).rotate( duration:2000.ms).fadeIn(duration:2000.ms),
                              SvgPicture.asset('icons/clipboard-text.svg', ).animate() .then(delay: 4000.ms).rotate( duration:1000.ms).fadeIn(duration:2000.ms),
                             SvgPicture.asset('icons/gear.svg', ).animate().then(delay: 4000.ms).rotate( duration:1000.ms).fadeIn(duration:2000.ms),
                             ]),
                       ),
                         ),
                             )   ],
                ).animate().then(delay: 2000.ms).slideY(begin:3, duration:2000.ms),
              ),
            ],
          ),
        //  bottomNavigationBar: 
          ),
          
    );
  }
}

class SmallButton extends StatelessWidget {
  final Widget child;
  final Color color;
  const SmallButton({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
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
