import 'package:flutter/material.dart';

import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:seponewenoapp/features/artist/artist_view.dart';
import 'package:seponewenoapp/features/home/widgets/backgroundApp.dart';
import 'package:seponewenoapp/features/home/widgets/topBar.dart';
import 'package:seponewenoapp/features/home/widgets/recommended_artist.dart';
import 'package:seponewenoapp/features/home/widgets/topten.dart';
import 'package:seponewenoapp/features/promotors/promotors_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
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
                              child: Column(
                                children: <Widget>[
                                  topAppBar('Beta'),
                                  // SizedBox( height: 15.0, ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //   children: <Widget>[
                                  //     OutlineButton(
                                  //       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  //       borderSide: BorderSide(color: Colors.white),
                                  //       highlightedBorderColor: Colors.white,
                                  //       textColor: Colors.white,
                                  //       color: Colors.lightGreenAccent,
                                  //       onPressed: (){
                                  //         Get.to(PromotorsView());
                                  //       },
                                  //       child: Row(
                                  //         children: <Widget>[
                                  //           Icon( Icons.speaker, color: Colors.white, ),
                                  //           Text('Promotores', style: TextStyle(color: Colors.white),),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     OutlineButton(
                                  //       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  //       borderSide: BorderSide(color: Colors.white),
                                  //       highlightedBorderColor: Colors.white,
                                  //       textColor: Colors.white,
                                  //       color: Colors.lightGreenAccent,
                                  //       onPressed: (){
                                  //         Get.to(ArtistView());
                                  //       },
                                  //       child: Row(
                                  //         children: <Widget>[
                                  //           Icon( FlevaIcons.mic_outline ),
                                  //           Text('Artistas', style: TextStyle(color: Colors.white),),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              )),
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric( horizontal: 25.0 ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text( 'Recomendado', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22.0 ),),
                                    ],
                                  ),
                                ),
                                RecommendedArtists(),
                                Container(
                                  padding: EdgeInsets.symmetric( horizontal: 25.0 ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text( 'Tendencia Actual', style: TextStyle( fontWeight: FontWeight.normal,fontSize: 22.0 ),),
                                    ],
                                  ),
                                ),
                                SizedBox( height: 5.0, ),
                                TopTen(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ]),
            );
  }
}