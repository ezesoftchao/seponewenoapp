import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:seponewenoapp/features/home/widgets/backgroundApp.dart';
import 'package:seponewenoapp/features/home/widgets/topBar.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:seponewenoapp/features/player/widgets/marquee_text.dart';
import 'package:seponewenoapp/features/songs/songs_view.dart';

class PromotorsView extends  StatefulWidget {
  @override
  _PromotorsViewState createState() => _PromotorsViewState();
}

class _PromotorsViewState extends State<PromotorsView>{

  List<String> name = List();
  List<String> image = List();
  List<String> link = List();

  void getData() async {

    //URL de la ruta promtores
    final response = await http.get('https://www.seponeweno.nat.cu/promotores');
    dom.Document document = parser.parse(response.body);

    //Selector div de cada artista
    final elements = document.querySelectorAll('div.col-md-3.content-grid1');
    setState(() {

      //Obtiene el nombre del artista
      name = elements
          .map((element) =>
      element.getElementsByClassName("button play-icon popup-with-zoom-anim")[0].innerHtml)
          .toList();

      //Obtiene el link de la imagen del artista
      image = elements
          .map((element) =>
      element.getElementsByTagName("img")[0].attributes['src'])
          .toList();

      //Obtiene el link de las canciones de los artistas
      link = elements
          .map((element) =>
      element.getElementsByTagName("a")[0].attributes['href'])
          .toList();
    }
    );
  }

  @override
  // ignore: must_call_super
  void initState() {
    getData();
  }

  //Arregla el simbolo &
  _amp(String value){
    return value.replaceAll("&amp;", "&");
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
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: topAppBar('Promotores')),
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
                                        MarqueeWidget(
                                          direction: Axis.horizontal,
                                          child: Text(
                                            (_amp(name[index]??"Cargando...")),
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),),
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

}