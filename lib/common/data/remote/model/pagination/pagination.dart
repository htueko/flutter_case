/// Pagination model
class Pagination {
  late final String status;
  late final int statusCode;
  late final int total;
  late final int limit;
  late final int offset;

  Pagination({
    required this.status,
    required this.statusCode,
    required this.total,
    required this.limit,
    required this.offset,
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status-code'];
    total = json['total'];
    limit = json['limit'];
    offset = json['offset'];
  }
}
