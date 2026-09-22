import 'dart:convert';

class CategoriaResponse {
  int id;
  String nombre;
  String texto1;
  String texto2;
  String imagen1;
  String imagen2;
  String imagen3;
  String imagen4;
  String contenido;
  DateTime createdAt;
  String texto3;

  CategoriaResponse({
    required this.id,
    required this.nombre,
    required this.texto1,
    required this.texto2,
    required this.imagen1,
    required this.imagen2,
    required this.imagen3,
    required this.imagen4,
    required this.contenido,
    required this.createdAt,
    required this.texto3,
  });

  factory CategoriaResponse.fromJson(String str) =>
      CategoriaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriaResponse.fromMap(Map<String, dynamic> json) =>
      CategoriaResponse(
        id: json["id"],
        nombre: json["nombre"],
        texto1: json["texto1"],
        texto2: json["texto2"],
        imagen1: json["imagen1"],
        imagen2: json["imagen2"],
        imagen3: json["imagen3"],
        imagen4: json["imagen4"],
        contenido: json["contenido"],
        createdAt: DateTime.parse(json["created_at"]),

        texto3: json["texto3"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nombre": nombre,
    "texto1": texto1,
    "texto2": texto2,
    "imagen1": imagen1,
    "imagen2": imagen2,
    "imagen3": imagen3,
    "imagen4": imagen4,
    "contenido": contenido,
    "created_at": createdAt.toIso8601String(),

    "texto3": texto3,
  };
}
