import 'dart:convert';

List<VariosResponse> variosResponseFromMap(String str) =>
    List<VariosResponse>.from(
      json.decode(str).map((x) => VariosResponse.fromMap(x)),
    );

String variosResponseToMap(List<VariosResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class VariosResponse {
  int id;
  String titulo;
  String destino;
  String color;

  VariosResponse({
    required this.id,
    required this.titulo,
    required this.destino,
    required this.color,
  });

  factory VariosResponse.fromMap(Map<String, dynamic> json) => VariosResponse(
    id: json["id"],
    titulo: json["titulo"],
    destino: json["destino"],
    color: json["color"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "titulo": titulo,
    "destino": destino,
    "color": color,
  };
}
