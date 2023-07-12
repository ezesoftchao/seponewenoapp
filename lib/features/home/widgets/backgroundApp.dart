import 'package:flutter/material.dart';

class BackgroudHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            /*image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/wp5840733.jpg'),
            ),*/
          ),
        ),
        Container(
          // height: 350.0,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: RadialGradient(
                radius: 0.8,
                colors: [
                  Colors.black12.withOpacity(0.5),
                  Colors.black.withOpacity(0.7),
                ],
              )),
        ),
      ],
    );
  }
}