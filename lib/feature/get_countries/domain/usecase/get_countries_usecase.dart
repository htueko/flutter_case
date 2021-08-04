import 'package:flutter_case/common/data/repository/countries_repository_impl.dart';
import 'package:flutter_case/common/domain/model/country.dart';
import 'package:get/get.dart';

class GetCountriesUseCase {
  final repo = Get.find<CountriesRepositoryImpl>();

  Future<List<Country>> call() async {
    return await repo.getCountriesFromDb();
  }
}
