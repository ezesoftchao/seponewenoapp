import 'package:flutter/material.dart';


import 'package:fleva_icons/fleva_icons.dart';

import 'package:seponewenoapp/features/home/home_page.dart';
import 'package:seponewenoapp/features/artist/artist_view.dart';
import 'package:seponewenoapp/features/promotors/promotors_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int currentIndex = 0;

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottonNavigationBar(),
            body: _callPage(currentIndex),
                      );
                    }
            
            Widget _bottonNavigationBar() {
              return BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.black54,
                currentIndex: currentIndex,
                onTap: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(FlevaIcons.home),
                    title: Text('Inicio'),
                    ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.mic),
                    title: Text('Artistas'),
                    ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.speaker),
                    title: Text('Promotores'),
                    ),
                ],
                );
            }
            
              Widget _callPage( int actualPage ) {

                switch( actualPage ){
                  case 0: return HomePage();
                  case 1: return ArtistView();
                  case 2: return PromotorsView();

                  default:
                    return HomePage();
                }
              }

      }  