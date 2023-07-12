import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(icon: Icon( FlevaIcons.arrow_ios_back, color: Colors.white, size: 25.0, ), onPressed: (){
                                  Navigator.pop(context);
                                }),
                                Text("Now Playing", style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.normal ),),
                                IconButton(icon: Icon( FlevaIcons.download, color: Colors.white, size: 25.0, ), onPressed: (){
                                  print("Download");
                                })
                              ],
                            );
  }
}