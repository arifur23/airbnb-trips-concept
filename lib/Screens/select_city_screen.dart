import 'package:airbnb_trips_concept/Screens/screens.dart';
import 'package:airbnb_trips_concept/Widgets/airbnb_logo_widget.dart';
import 'package:flutter/material.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({Key? key}) : super(key: key);

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> with TickerProviderStateMixin {

  late Offset startingOffset = const Offset(0, 0);
  late Offset endingOffset = const Offset(0, 0);

  late AnimationController logoAnimationController;
  late Animation logoAnimation;

  @override
  void initState() {
    logoAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
        vsync: this
    );

    logoAnimation = Tween<double>(begin: 1, end: 100).animate(CurvedAnimation(parent: logoAnimationController, curve: Curves.easeIn) );
    logoAnimationController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: AnimatedBuilder(
                      animation: logoAnimationController,
                      builder: (context, child) => Transform(
                        transform: Matrix4.identity()
                          ..translate(-logoAnimation.value, 0.0, 0.0),
                        child: const AirbnbLogoWidget(),
                      ),
                    child: const AirbnbLogoWidget(),
                  ),
                ),
                const SizedBox(height: 30,),
                const Text('Select City', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              ],
            ),
            Positioned(
              top: 200,
                left: 0,
                child: Container(
                  height: size.height * .45,
                  width: (size.width / 2) - 65 ,
                  child: Column(
                    children:  [
                      CityWidget(city: 'Bangalore', onTap: (offset) {
                        setState(() {
                          startingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'West Sabrynafurt', onTap: (offset) {
                        setState(() {
                          startingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'East Dorothyfurt', onTap: (offset) {
                        setState(() {
                          startingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'Summermouth', onTap: (offset) {
                        setState(() {
                          startingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'Lake Ricardo', onTap: (offset) {
                        setState(() {
                          startingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'Delaneystad', onTap: (offset) {
                        setState(() {
                          startingOffset = offset;
                        });
                      }),
                    ],
                  ),
                )
            ),
            Positioned(
                top: 200,
                right: 0,
                child: Container(
                  height: size.height * .45,
                  width: (size.width / 2) - 65 ,
                  child: Column(
                    children:  [
                      CityWidget(city: 'Lake Tressa', onTap: (offset) {
                        setState(() {
                          endingOffset = offset;
                        });
                      },),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'Mathewville',onTap: (offset) {
                        setState(() {
                          endingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'West Penelopeberg',onTap: (offset) {
                        setState(() {
                          endingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'East Darrrontown',onTap: (offset) {
                        setState(() {
                          endingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'Guwahati',onTap: (offset) {
                        setState(() {
                          endingOffset = offset;
                        });
                      }),
                      const SizedBox(height: 35,),
                      CityWidget(city: 'Lake Ray',onTap: (offset) {
                        setState(() {
                          endingOffset = offset;
                        });
                      }),
                    ],
                  ),
                )
            ),
            Positioned(
              top: 200,
                left: 145,
                child: Container(
                  height: size.height * .45,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: endingOffset == const Offset(0,0) ? null : CustomPaint(
                    painter: DrawConnection( Offset(40,startingOffset.dy - (275)), Offset(40, endingOffset.dy - (275 + 40)), true),
      ),
                )
            ),
            Positioned(
              bottom: 70,
              left: (size.width / 2) - 50,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ConvenientDateScreen()));
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_forward, size:  30, color: Colors.white,),
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}

class CityWidget extends StatefulWidget {
  final String city;
  final Function(Offset offset)? onTap;

  const CityWidget({super.key, required this.city, required this.onTap});

  @override
  State<CityWidget> createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        RenderBox box = context.findRenderObject() as RenderBox;
        Offset globalPosition = box.localToGlobal(Offset.zero);
        print(globalPosition.toString());
        widget.onTap!(globalPosition);
        selected = !selected;
      },
      child: Container(
        height: 40,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: selected ? Colors.red.withOpacity(.7) : Colors.grey.withOpacity(.5), width: 2)
        ),
        child: Center(
          child: Text(widget.city, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black.withOpacity(.7)),),
        ),
      ),
    );
  }
}

class DrawConnection extends CustomPainter{

  final Offset start;
  final Offset end;
  final bool flipConnector;

  DrawConnection(this.start, this.end, this.flipConnector);

  Offset getStartDy() => start;


  @override
  void paint(Canvas canvas, Size size) {

    bool isUp = false;
    bool isEqual = false;

    if(start.dy == end.dy + 40){
      isEqual = true;
      print('Equal');
    }
    if(start.dy > end.dy + 40){
      isUp = true;
      print('Up');
    }

    var linePaint = Paint()
        ..color = Colors.red
        ..strokeWidth = 2;

    var arc1Paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

    var arc2Paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = Path();

    path.moveTo( start.dx - 20.0 , start.dy - 20);
    path.arcToPoint( Offset(start.dx, isUp ? start.dy - 40: start.dy) , radius: const Radius.circular(18), clockwise: isUp ? false : true);
    isEqual ? null : canvas.drawPath(path, arc1Paint);

    path.moveTo( start.dx , isUp ? end.dy + 40 : end.dy);
    path.arcToPoint( Offset(start.dx + 20, end.dy + 20 ), radius: const Radius.circular(18), clockwise: isUp ? true : false);
    isEqual ? canvas.drawLine( Offset(start.dx - 40, start.dy - 20), Offset(80, end.dy + 20), linePaint) : canvas.drawPath(path, arc2Paint);

    canvas.drawLine( Offset(start.dx - 40, start.dy - 20), Offset( start.dx - 20, start.dy - 20), linePaint);
    isEqual ? null : canvas.drawLine(Offset(start.dx, isUp ? start.dy - 40 : start.dy), Offset(end.dx, isUp ? end.dy + 40 : end.dy), linePaint);
    canvas.drawLine( Offset(start.dx + 35.0, end.dy + 13), Offset(80, end.dy + 20), linePaint);
    canvas.drawLine( Offset(start.dx + 20.0, end.dy + 20), Offset(80, end.dy + 20), linePaint);
    canvas.drawLine( Offset(start.dx + 35.0, end.dy + 27), Offset(80, end.dy + 20), linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}
