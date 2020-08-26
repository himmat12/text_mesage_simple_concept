import 'geo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({this.street, this.city, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
