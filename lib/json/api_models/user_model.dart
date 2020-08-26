import 'package:json_annotation/json_annotation.dart';
import 'package:test001_aleen/json/api_models/company_model.dart';

import 'address_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({
    this.name,
    this.email,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
