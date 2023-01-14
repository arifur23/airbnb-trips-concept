import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';



class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> with TickerProviderStateMixin {

  late AnimationController priceAnimationController;

  @override
  void initState() {
    priceAnimationController = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 500)
    );
    priceAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    priceAnimationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                const AirbnbLogoWidget(),
                const SizedBox(height: 80,),
                Text('Widest network,', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30, color: Colors.black.withOpacity(.8)),),
                const SizedBox(height: 4,),
                Text('lowest fares', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30, color: Colors.black.withOpacity(.8))),
                const SizedBox(height: 30,),
                Text('All fares are quoted for single journeys(one-',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.7),),),
                const SizedBox(height: 5,),
                Text('way) and for dedicated travel periods only. ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black.withOpacity(.7)),),
                const SizedBox(height: 5,),
                Text('Fares include airport taxes.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.7),),),
                const SizedBox(height: 40,),
                AnimatedBuilder(
                    animation: priceAnimationController,
                    builder: (context, child) => Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, .001)
                        ..rotateY(0 + (1 - priceAnimationController.value)),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('BLR - GUW', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.3)),),
                            const SizedBox(height: 30,),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('3,899', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.red),),
                            )
                          ],
                        ),
                      ),
                    ),
                  child: Transform(
                    transform: Matrix4.identity()
                    ..setEntry(3, 2, .001)
                      ..rotateY(1 + (1 - priceAnimationController.value)),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BLR - GUW', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.3)),),
                          const SizedBox(height: 30,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('3,899', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.red),),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 120,
              left: (size.width / 2) - 30,
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle
                ),
                child: const Center(
                  child: Icon(Icons.fingerprint, color: Colors.white, size: 45,),
                ),
              )
          )
        ],
      )
    );
  }
}
