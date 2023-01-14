import 'package:flutter/material.dart';

class AirbnbLogoWidget extends StatelessWidget {
  const AirbnbLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 40,
            width: 40,
            child: Image.asset('images/airbnb.png', fit: BoxFit.cover,)
        ),
        const SizedBox(width: 10,),
        const Text('airbnb', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),)
      ],
    );
  }
}