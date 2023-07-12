import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seponewenoapp/features/home/widgets/backgroundApp.dart';
import 'package:seponewenoapp/features/player/widgets/bar.dart';

class Player extends StatefulWidget {
  Player({Key key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: AnnotatedRegion<SystemUiOverlayStyle>(
         value: SystemUiOverlayStyle.light,
         child: Stack(
           children: <Widget>[
             BackgroudHome(),
             SafeArea(
               child: Container(
                 padding: EdgeInsets.only( left: 7.0, right: 7.0, top: 5.0 ),
                 child: Column(
                   children: <Widget>[
                     Container(
                        child: Column(
                          children: <Widget>[
                            Bar(),
                            Column(
                              children: <Widget>[
                                Container(
                                  child: Image.network(""),
                                ),
                                Text("Hola mundo"),
                              ],
                            ),
                            Container(),
                          ],
                        )),
                   ],
                 ),
               ),
            )
           ],
         ),
       )
    );
  }
}