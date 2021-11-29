import 'dart:convert';

class GeoEntity {
  String? lat;
  String? lng;

  GeoEntity({this.lat, this.lng});

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  factory GeoEntity.fromMap(Map<String, dynamic> data) => GeoEntity(
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'lng': lng,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GeoEntity].
  factory GeoEntity.fromJson(String data) {
    return GeoEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GeoEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  GeoEntity copyWith({
    String? lat,
    String? lng,
  }) {
    return GeoEntity(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }
}
