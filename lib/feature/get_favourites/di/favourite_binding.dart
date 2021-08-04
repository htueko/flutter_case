import 'package:flutter_case/feature/get_favourites/controller/favourite_controller.dart';
import 'package:get/get.dart';

class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavouriteController());
  }
}
