import 'dart:convert';

class DataCacheEntity {
  String? data;

  DataCacheEntity({this.data});

  @override
  String toString() => 'DataCacheEntity(data: $data)';

  factory DataCacheEntity.fromMap(Map<String, dynamic> data) {
    return DataCacheEntity(
      data: data['data'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DataCacheEntity].
  factory DataCacheEntity.fromJson(String data) {
    return DataCacheEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DataCacheEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  DataCacheEntity copyWith({
    String? data,
  }) {
    return DataCacheEntity(
      data: data ?? this.data,
    );
  }
}
