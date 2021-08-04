/// model for local database operations
class CacheCountry {
  final String code;
  final String name;
  final String region;
  final bool isFavourite;

  const CacheCountry(
      {required this.code,
      required this.name,
      required this.region,
      required this.isFavourite});

  Map<String, Object?> toJson() => {
        CacheCountryFields.code: code,
        CacheCountryFields.name: name,
        CacheCountryFields.region: region,
        CacheCountryFields.isFavourite: isFavourite ? 1 : 0,
      };

  CacheCountry copy(
          {String? code, String? name, String? region, bool? isFavourite}) =>
      CacheCountry(
        code: code ?? this.code,
        name: name ?? this.name,
        region: region ?? this.region,
        isFavourite: isFavourite ?? this.isFavourite,
      );

  static CacheCountry fromJson(Map<String, Object?> json) => CacheCountry(
        code: json[CacheCountryFields.code] as String,
        name: json[CacheCountryFields.name] as String,
        region: json[CacheCountryFields.region] as String,
        isFavourite: json[CacheCountryFields.isFavourite] == 1,
      );
}

class CacheCountryFields {
  static final String code = 'code';
  static final String name = 'name';
  static final String region = 'region';
  static final String isFavourite = 'isFavourite';
  static final List<String> values = [code, name, region, isFavourite];
}
