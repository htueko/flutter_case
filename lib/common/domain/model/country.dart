/// model for business logic
class Country {
  late String name;
  late String region;
  late String code;
  late bool isFavourite;

  Country(
      {required this.name,
      required this.region,
      required this.code,
      this.isFavourite = false});
}
