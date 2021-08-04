import 'package:flutter_case/common/domain/model/country.dart';

/// contract for repository pattern
abstract class CountriesRepository {
  /// to get the remote data
  fetchCountries(int offset);
  /// to save to local db
  saveCountryToDb(Country country);
  /// to update to local db
  updateCountryToDb(Country country);
  /// to get the data from db
  Future<List<Country>> getCountriesFromDb();
  /// to get the data from db
  Future<List<Country>> getFavouriteCountries();
}
