import 'dart:convert';

Rol rolFromJson(String str) => Rol.fromJson(json.decode(str));

String rolToJson(Rol data) => json.encode(data.toJson());

//modelo que mapea la tabla rol de la base de datos
class Rol {
  Rol({
    this.id,
    this.name,
    this.image,
    this.route,
  });

  String id;
  String name;
  String image;
  String route;

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
    id: json["id"] is int ? json['id'].toString() : json["id"],
    name: json["name"],
    image: json["image"],
    route: json["route"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "route": route,
  };
}
