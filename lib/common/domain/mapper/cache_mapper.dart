/// contract to implement
abstract class CacheMapper<Domain, Cache> {
  /// return Cache from Domain
  Cache mapFromDomain(Domain domain);
  /// return Domain from Cache
  Domain mapFromCache(Cache cache);
}
