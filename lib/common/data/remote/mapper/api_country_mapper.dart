import 'package:flutter_case/common/data/remote/model/country/api_country.dart';
import 'package:flutter_case/common/domain/mapper/api_mapper.dart';
import 'package:flutter_case/common/domain/model/country.dart';

class ApiCountryMapper extends ApiMapper<ApiCountry, Country> {
  @override
  Country mapToDomain(ApiCountry apiEntity) {
    return Country(
        name: apiEntity.name, region: apiEntity.region, code: apiEntity.code);
  }
}
