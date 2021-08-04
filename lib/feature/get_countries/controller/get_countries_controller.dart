import 'package:flutter/material.dart';
import 'package:flutter_case/common/domain/model/country.dart';
import 'package:flutter_case/feature/get_countries/domain/usecase/fetch_countries_usecase.dart';
import 'package:flutter_case/feature/get_countries/domain/usecase/get_countries_usecase.dart';
import 'package:flutter_case/feature/get_countries/domain/usecase/update_country_usecase.dart';
import 'package:get/get.dart';

class GetCountriesController extends GetxController {
  late FetchCountriesUseCase _fetchCountriesUseCase;
  late GetCountriesUseCase _getCountriesUseCase;
  late UpdateCountryUseCase _updateCountryUseCase;
  ScrollController scrollController = ScrollController();

  GetCountriesController() {
    _fetchCountriesUseCase = Get.put(FetchCountriesUseCase());
    _getCountriesUseCase = Get.put(GetCountriesUseCase());
    _updateCountryUseCase = Get.put(UpdateCountryUseCase());
    getCountries();
    paginationTask();
  }

  RxList<Country> countries = <Country>[].obs;
  RxBool isLoading = false.obs;
  RxInt offsetCount = 0.obs;
  final int offsetLimit = 240;

  getCountries() async {
    showLoading();
    final data = await _getCountriesUseCase.call();
    hideLoading();
    countries.value = data;
    print('getCountries $offsetCount');
  }

  updateCountry(Country country) async {
    country.isFavourite = country.isFavourite ? false : true;
    await _updateCountryUseCase(country);
    getCountries();
  }

  showLoading() {
    isLoading.value = true;
    print(isLoading.value);
  }

  hideLoading() {
    isLoading.value = false;
     print(isLoading.value);
  }

  void paginationTask() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        print('reached scroll max');
        updateOffset();
        fetchNextCountries(offsetCount.value);
      }
    });
  }

  updateOffset() {
    if (offsetCount.value <= offsetLimit) {
      offsetCount.value = countries.length;
      print('updateOffset $offsetCount');
    }
  }

  fetchNextCountries(int offset) async {
    showLoading();
    final data = await _fetchCountriesUseCase.call(offset);
    hideLoading();
    countries.value = data;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
