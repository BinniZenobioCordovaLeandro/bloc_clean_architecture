import 'dart:convert';

class CompanyEntity {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyEntity({this.name, this.catchPhrase, this.bs});

  @override
  String toString() {
    return 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
  }

  factory CompanyEntity.fromMap(Map<String, dynamic> data) => CompanyEntity(
        name: data['name'] as String?,
        catchPhrase: data['catchPhrase'] as String?,
        bs: data['bs'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CompanyEntity].
  factory CompanyEntity.fromJson(String data) {
    return CompanyEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CompanyEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  CompanyEntity copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return CompanyEntity(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }
}
