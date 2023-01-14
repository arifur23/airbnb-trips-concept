import 'package:airbnb_trips_concept/Screens/screens.dart';
import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late AnimationController planeAnimationController;
  late AnimationController starAnimationController;
  late AnimationController circleAnimationController;

  late Animation circleAnimation;
  late Animation starAnimation;

  @override
  void initState() {
    planeAnimationController = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds:  600)
    );
    planeAnimationController.forward();

    circleAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    circleAnimation = Tween<double>(
      begin: -5, end:  10
    ).animate(CurvedAnimation(parent: circleAnimationController, curve: const Interval(.5, 1.0, curve: Curves.bounceInOut)));


    circleAnimationController.forward();

    circleAnimationController.addStatusListener((status)
    {
      if(status == AnimationStatus.completed){
        circleAnimationController.reverse(from: 1);
        setState(() {

        });
      }
    });


    starAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    starAnimation = Tween<double>(
        begin: -5, end:  10,
    ).animate(CurvedAnimation(parent: starAnimationController, curve: const Interval(.5, 1.0, curve: Curves.bounceInOut)));


    starAnimationController.forward();

    starAnimationController.addStatusListener((status)
    {
      if(status == AnimationStatus.completed){
        starAnimationController.reverse(from: 1);
        setState(() {

        });
      }
    });


    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 140),
            child: AirbnbLogoWidget(),
          ),
          const SizedBox(height: 60,),
          Container(
            height: 220,
            width: 220,
            decoration: const BoxDecoration(
              color: Color(0xffff3c59),
              shape: BoxShape.circle
            ),
            child: Stack(
              children: [
                 starWidget( 40.0 + starAnimation.value, 45.0 + starAnimation.value, 10.0,  10.0,),
                 starWidget( 170.0 + starAnimation.value,  110.0 + starAnimation.value,  7,  7,),
                 circleWidget( 127.0 + circleAnimation.value,  25.0 + circleAnimation.value,  20,  20,),
                 circleWidget( 55.0 + circleAnimation.value,  105.0 + circleAnimation.value,  9,  9,),
                 circleWidget( 90.0 + circleAnimation.value,  180.0 + circleAnimation.value,  7,  7,),
                AnimatedBuilder(
                    animation: planeAnimationController,
                    builder: (context, child) =>
                        Positioned(
                          top: 120 - ( 50) * planeAnimationController.value,
                            left: -10 + (75) * planeAnimationController.value,
                            child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Image.asset('images/plane.png', fit: BoxFit.cover )
                            )
                        ))
              ]
                ),),

          const SizedBox(height: 120),
          const Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 ),),
          const SizedBox(height: 30),
          Text('lorem ipsum dolor sit amit', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black.withOpacity(.4)),),
          const SizedBox(height: 10),
          Text('lorem ipsum dolor', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black.withOpacity(.4)),),
          const SizedBox(height: 70),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SelectCityScreen()));
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffff3c59),
              ),
              child: const Center(
                child: Icon(Icons.arrow_forward, size: 35, color: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget circleWidget(double top, double left, double height ,double width) {

    return AnimatedBuilder(
      animation: circleAnimationController,
      builder: (context, child) =>
          Positioned(
            top: top,
              left: left,
              child: Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
              )
          ),
      child: Positioned(
          top: top,
          left: left,
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
          )
      ),
    );
  }

  Widget starWidget( double top, double left, double height ,double width){

    return AnimatedBuilder(
        animation: starAnimationController,
        builder: (context, child) =>
            Transform(
              transform: Matrix4.identity()
              ..translate(left, top, 0.0),
              child: Container(
                  height: height,
                  width: width,
                  child: Image.asset('images/star.png')),
            ),
    );
  }
}
