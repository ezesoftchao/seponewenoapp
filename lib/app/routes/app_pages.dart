import 'package:get/route_manager.dart';


import 'package:seponewenoapp/features/home/home_binding.dart';
import 'package:seponewenoapp/features/home/home_view.dart';

import 'package:seponewenoapp/features/artist/artist_binding.dart';
import 'package:seponewenoapp/features/artist/artist_view.dart';

import 'package:seponewenoapp/features/promotors/promotors_binding.dart';
import 'package:seponewenoapp/features/promotors/promotors_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page:()=> HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ARTIST,
      page:()=> ArtistView(),
      binding: ArtistBinding(),
    ),
    GetPage(
      name: Routes.PROMOTORS,
      page:()=> PromotorsView(),
      binding: PromotorsBinding(),
    ),
  ];
}