/// Country model
/// "DZ":{
//          "country":"Algeria",
//          "region":"Africa"
//       }
class ApiCountry {
  late final String name;
  late final String region;
  late final String code;

  ApiCountry({required this.name, required this.region, required this.code});

  ApiCountry.fromJson({required String code, required Map<String, dynamic> json}) {
    this.code = code;
    this.name = json['country'];
    this.region = json['region'];
  }
}
