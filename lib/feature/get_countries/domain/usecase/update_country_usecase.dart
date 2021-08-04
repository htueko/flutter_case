import 'package:flutter_case/common/data/repository/countries_repository_impl.dart';
import 'package:flutter_case/common/domain/model/country.dart';
import 'package:get/get.dart';

class UpdateCountryUseCase {
  final repo = Get.find<CountriesRepositoryImpl>();

  call(Country country) async {
    await repo.updateCountryToDb(country);
  }
}
