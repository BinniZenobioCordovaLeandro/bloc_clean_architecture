import 'dart:convert';

import 'geo_entity.dart';

class AddressEntity {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoEntity? geo;

  AddressEntity({this.street, this.suite, this.city, this.zipcode, this.geo});

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }

  factory AddressEntity.fromMap(Map<String, dynamic> data) => AddressEntity(
        street: data['street'] as String?,
        suite: data['suite'] as String?,
        city: data['city'] as String?,
        zipcode: data['zipcode'] as String?,
        geo: data['geo'] == null
            ? null
            : GeoEntity.fromMap(data['geo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddressEntity].
  factory AddressEntity.fromJson(String data) {
    return AddressEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddressEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  AddressEntity copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    GeoEntity? geo,
  }) {
    return AddressEntity(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }
}
