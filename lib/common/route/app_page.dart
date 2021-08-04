import 'package:flutter_case/feature/get_countries/di/get_countries_binding.dart';
import 'package:flutter_case/feature/get_countries/view/get_countries_view.dart';
import 'package:flutter_case/feature/get_favourites/di/favourite_binding.dart';
import 'package:flutter_case/feature/get_favourites/view/favourite_view.dart';
import 'package:get/get.dart';

import 'app_route.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.countriesRoute,
      page: () => GetCountriesView(),
      binding: GetCountriesBinding(),
    ),
    GetPage(
      name: AppRoutes.favouriteRoute,
      page: () => FavouriteView(),
      binding: FavouriteBinding(),
    ),
  ];
}
