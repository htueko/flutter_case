import 'package:flutter_case/common/domain/model/country.dart';
import 'package:flutter_case/feature/get_favourites/domain/usecase/get_favourite_countries_usecase.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  late GetFavouriteCountriesUseCase _getFavouriteCountriesUseCase;

  FavouriteController() {
    _getFavouriteCountriesUseCase = Get.put(GetFavouriteCountriesUseCase());
    getFavouriteCountries();
  }

  RxList<Country> countries = <Country>[].obs;

  getFavouriteCountries() async {
    final data = await _getFavouriteCountriesUseCase.call();
    countries.value = data;
  }
}
