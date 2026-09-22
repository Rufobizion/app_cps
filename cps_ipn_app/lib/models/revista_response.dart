// To parse this JSON data, do
//
//     final revistaResponse = revistaResponseFromMap(jsonString);

import 'dart:convert';

List<RevistaResponse> revistaResponseFromMap(String str) =>
    List<RevistaResponse>.from(
      json.decode(str).map((x) => RevistaResponse.fromMap(x)),
    );

String revistaResponseToMap(List<RevistaResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class RevistaResponse {
  int id;
  String titulo;
  String numero;
  String fecha;
  String url;
  String imagen;

  RevistaResponse({
    required this.id,
    required this.titulo,
    required this.numero,
    required this.fecha,
    required this.url,
    required this.imagen,
  });

  factory RevistaResponse.fromMap(Map<String, dynamic> json) => RevistaResponse(
    id: json["id"],
    titulo: json["titulo"],
    numero: json["numero"],
    fecha: json["fecha"],
    url: json["url"],
    imagen: json["imagen"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "titulo": titulo,
    "numero": numero,
    "fecha": fecha,
    "url": url,
    "imagen": imagen,
  };
}
