import 'package:json_annotation/json_annotation.dart';

part 'geo_model.g.dart';

@JsonSerializable()
class Geo {
  String lng;
  String lat;

  Geo({this.lat, this.lng});
  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}
