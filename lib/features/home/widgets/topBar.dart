import 'package:flutter/material.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:seponewenoapp/features/about/about_view.dart';

class topAppBar extends StatelessWidget {

  final String title;

  topAppBar( this.title );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: TextStyle( fontWeight: FontWeight.normal, fontSize: 32.0, color: Colors.white),),
        IconButton(icon: Icon( FlevaIcons.info_outline, color: Colors.white, size: 25.0, ), onPressed: (){
          Get.to(AboutView());
        })
      ],
    );
  }
}
