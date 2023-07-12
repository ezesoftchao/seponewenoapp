/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seponewenoapp/features/home/home_view.dart';


import 'package:seponewenoapp/features/home/widgets/backgroundApp.dart';
import 'package:seponewenoapp/features/home/widgets/topBar.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:seponewenoapp/features/songs/songs_view.dart';

class CheckView extends  StatefulWidget {
  @override
  _CheckViewState createState() => _CheckViewState();
}

class _CheckViewState extends State<CheckView>{

  String status = "";
  void getData() async {

    //URL de la ruta artista
    final response = await http.get('https://ezesoftchao.cubava.cu/test/');
    dom.Document document = parser.parse(response.body);

    //Selector div de cada artista
    if( document.toString().contains("desactivado:true")){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>
          HomeView(),
      ));

        status = "off";
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
    getData();
  }



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
                  topAppBar('Artistas'),
                  SizedBox( height: 15.0, ),
                  name.length == 0 ? Center(child: Text("Cargando", style: TextStyle(color: Colors.white54, fontSize: 32.0),)):
                  Expanded(
                    child: GridView.builder(
                      itemCount: name.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SongsView('https://www.seponeweno.nat.cu/'+link[index], 'https://www.seponeweno.nat.cu/'+image[index])),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(image: NetworkImage('https://www.seponeweno.nat.cu/'+image[index])),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      gradient: LinearGradient(
                                          begin: FractionalOffset(0.0, 0.4),
                                          end: FractionalOffset(0.0, 0.8),
                                          colors: [
                                            Colors.black12,
                                            Colors.black,
                                          ]
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Text(_amp(name[index]),
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        SizedBox(height: 8.0,)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],),
      ),
    );
  }

}*/
