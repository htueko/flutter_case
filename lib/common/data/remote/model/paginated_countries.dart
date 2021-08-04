import 'country/api_country.dart';
import 'pagination/pagination.dart';

class PaginatedCountries {
  late final Pagination pagination;
  late final List<ApiCountry> countries;

  PaginatedCountries({required this.pagination, required this.countries});

  PaginatedCountries.fromJson(Map<String, dynamic> json) {
    pagination = Pagination.fromJson(json);
    countries = [];
    print("${pagination.total}");
    final Map<String, dynamic> data = json['data'];
    print("${data.length}");
    data.forEach((key, value) { countries.add(ApiCountry.fromJson(code: key, json: value)); });
    print("${countries.length}");
  }
}
