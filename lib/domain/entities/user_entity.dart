import 'dart:convert';

import 'package:clean_architecture/domain/entities/address_entity.dart';

import 'company_entity.dart';

class UserEntity {
  int? id;
  String? name;
  String? username;
  String? email;
  AddressEntity? address;
  String? phone;
  String? website;
  CompanyEntity? company;

  UserEntity({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }

  factory UserEntity.fromMap(Map<String, dynamic> data) => UserEntity(
        id: data['id'] as int?,
        name: data['name'] as String?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        address: data['address'] == null
            ? null
            : AddressEntity.fromMap(data['address'] as Map<String, dynamic>),
        phone: data['phone'] as String?,
        website: data['website'] as String?,
        company: data['company'] == null
            ? null
            : CompanyEntity.fromMap(data['company'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address?.toMap(),
        'phone': phone,
        'website': website,
        'company': company?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserEntity].
  factory UserEntity.fromJson(String data) {
    return UserEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  UserEntity copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    AddressEntity? address,
    String? phone,
    String? website,
    CompanyEntity? company,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }
}
