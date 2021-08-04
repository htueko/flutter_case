/// contract to implement
abstract class ApiMapper<Entity, Domain> {
  /// return Domain from Entity
  Domain mapToDomain(Entity apiEntity);
}