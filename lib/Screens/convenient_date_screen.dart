import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'screens.dart';

class ConvenientDateScreen extends StatefulWidget {
  const ConvenientDateScreen({Key? key}) : super(key: key);

  @override
  State<ConvenientDateScreen> createState() => _ConvenientDateScreenState();
}

class _ConvenientDateScreenState extends State<ConvenientDateScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(height: 30,),
            const AirbnbLogoWidget(),
            const SizedBox(height: 30,),
            const Text('Convenient date', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            const SizedBox(height: 40,),
            Container(
              height: size.height * .37,
              width:  size.width - 60,
              decoration: const BoxDecoration(
              ),
              child: CalendarWidget(),
            ),

            const SizedBox(height: 30,),
            Container(
              height: 150,
              width: size.width -60,
              decoration: const BoxDecoration(
                // color: Colors.blue
              ),
              child: Column(
                children: const [
                  TimePickerWidget()
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 155.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const PriceScreen()));
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_forward, color: Colors.white, size: 30,),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
