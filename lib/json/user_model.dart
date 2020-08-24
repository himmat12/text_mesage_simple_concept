class Geo {
  String lat;
  String lng;

  Geo({this.lat, this.lng});
  Geo.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lng = json['lng'];
}

class Address {
  String street;
  String city;
  Geo geo;

  Address({this.street, this.city, this.geo});
  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'],
        city = json['city'],
        geo = Geo.fromJson(json['geo']);
}

class User {
  String name;
  String email;
  Address address;

  User({
    this.name,
    this.email,
    this.address,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        address = Address.fromJson(json['address']);
}
