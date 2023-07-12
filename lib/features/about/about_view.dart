import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:seponewenoapp/features/home/widgets/backgroundApp.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(children: <Widget>[
          BackgroudHome(),
          SafeArea(
              child: Container(
                padding: EdgeInsets.only( left: 7.0, right: 7.0, top: 10.0 ),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 18),
                        child: Row(
                          children: <Widget>[
                            Text("Acerca de", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 32.0, color: Colors.white),),
                          ],
                        ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("Version: (beta)", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 22.0 ),),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("Desarrolladores", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 22.0 ),),
                          Text("Ezequiel Chao", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 18.0 ),),
                          Text("https://t.me/ezesoft", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 18.0 ),),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("Agradecimientos", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 22.0 ),),
                          Text("Rita Mora", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 18.0 ),),
                          Text("Lazhi La Promo", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 18.0 ),),
                          Text("Flutter Cuba", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 18.0 ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ])
      ),
    );
  }
}