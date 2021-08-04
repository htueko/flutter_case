import 'package:flutter_case/common/data/repository/countries_repository_impl.dart';
import 'package:get/get.dart';

class FetchCountriesUseCase {
  final repo = Get.find<CountriesRepositoryImpl>();

  call(int offset) async{
    await repo.fetchCountries(offset);
  }
}
