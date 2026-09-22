// To parse this JSON data, do
//
//     final comitesResponse = comitesResponseFromMap(jsonString);

import 'dart:convert';

List<ComitesResponse> comitesResponseFromMap(String str) =>
    List<ComitesResponse>.from(
      json.decode(str).map((x) => ComitesResponse.fromMap(x)),
    );

String comitesResponseToMap(List<ComitesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ComitesResponse {
  int id;
  String unidad;
  String url;
  String logo;
  String nombre;
  bool cumple;
  //  String updatedAt;
  String createdAt;

  ComitesResponse({
    required this.id,
    required this.unidad,
    required this.url,
    required this.logo,
    required this.nombre,
    required this.cumple,
    //  required this.updatedAt,
    required this.createdAt,
  });

  factory ComitesResponse.fromMap(Map<String, dynamic> json) => ComitesResponse(
    id: json["id"],
    unidad: json["unidad"],
    url: json["url"],
    logo: json["logo"],
    nombre: json["nombre"],
    cumple: json["cumple"],
    // updatedAt: json["updated_at"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "unidad": unidad,
    "url": url,
    "logo": logo,
    "nombre": nombre,
    "cumple": cumple,
    // "updated_at": updatedAt,
    "created_at": createdAt,
  };
}
