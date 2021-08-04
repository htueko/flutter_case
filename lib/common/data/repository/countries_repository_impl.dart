import 'package:flutter_case/common/data/local/app_database.dart';
import 'package:flutter_case/common/data/local/mapper/cache_country_mapper.dart';
import 'package:flutter_case/common/data/remote/http_service.dart';
import 'package:flutter_case/common/data/remote/http_service_impl.dart';
import 'package:flutter_case/common/data/remote/mapper/api_country_mapper.dart';
import 'package:flutter_case/common/data/remote/model/paginated_countries.dart';
import 'package:flutter_case/common/data/remote/remote_constant.dart';
import 'package:flutter_case/common/domain/model/country.dart';
import 'package:flutter_case/common/domain/repository/countries_repository.dart';
import 'package:get/get.dart';

class CountriesRepositoryImpl implements CountriesRepository {
  late HttpService _httpService;
  late ApiCountryMapper _apiMapper;
  late CacheCountryMapper _cacheMapper;

  CountriesRepositoryImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _apiMapper = Get.put(ApiCountryMapper());
    _cacheMapper = Get.put(CacheCountryMapper());
    _httpService.init();
  }

  @override
  fetchCountries(int offset) async {
    try {
      /// get the result from network call
      final result =
          await _httpService.getRequest(PARAM_COUNTRY, offset.toString());

      /// convert network json to local response model
      final response = PaginatedCountries.fromJson(result.data);

      /// save the list of country to database
      response.countries.forEach((element) {
        saveCountryToDb(_apiMapper.mapToDomain(element));
      });
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<List<Country>> getCountriesFromDb() async {
    var result = await AppDatabase.instance.getCountries();
    return result.map((e) => _cacheMapper.mapFromCache(e)).toList();
  }

  @override
  saveCountryToDb(Country country) async {
    await AppDatabase.instance
        .insertCountry(_cacheMapper.mapFromDomain(country));
  }

  @override
  updateCountryToDb(Country country) async {
    await AppDatabase.instance
        .updateCountry(_cacheMapper.mapFromDomain(country));
  }

  @override
  Future<List<Country>> getFavouriteCountries() async {
    final data = await AppDatabase.instance.getCountries();
    var favList = data.where((element) => element.isFavourite == true).toList();
    return favList.map((e) => _cacheMapper.mapFromCache(e)).toList();
  }
}
