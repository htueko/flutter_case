import 'package:flutter_case/common/data/repository/countries_repository_impl.dart';
import 'package:flutter_case/feature/get_countries/controller/get_countries_controller.dart';
import 'package:get/get.dart';

class GetCountriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CountriesRepositoryImpl());
    Get.put(GetCountriesController());
  }
}
