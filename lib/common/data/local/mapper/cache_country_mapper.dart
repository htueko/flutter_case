import 'package:flutter_case/common/data/local/model/cache_country.dart';
import 'package:flutter_case/common/domain/mapper/cache_mapper.dart';
import 'package:flutter_case/common/domain/model/country.dart';

class CacheCountryMapper extends CacheMapper<Country, CacheCountry> {
  @override
  CacheCountry mapFromDomain(Country domain) {
    return CacheCountry(
        code: domain.code,
        name: domain.name,
        region: domain.region,
        isFavourite: domain.isFavourite);
  }

  @override
  Country mapFromCache(CacheCountry cache) {
    return Country(
        name: cache.name,
        region: cache.region,
        code: cache.code,
        isFavourite: cache.isFavourite);
  }
}
