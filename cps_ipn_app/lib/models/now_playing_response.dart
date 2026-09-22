//import 'package:meta/meta.dart';
import 'dart:convert';

class NowPlayingResponse {
  int id;
  String imagen;
  String titulo;
  String url;
  //  String updatedAt;
  String createdAt;

  get fullImg {
    return 'nuerubnfcivddxflfwls.supabase.co/storage/v1/object/public/CPS/slider/$imagen';
  }

  NowPlayingResponse({
    required this.id,
    required this.imagen,
    required this.titulo,
    required this.url,
    //    required this.updatedAt,
    required this.createdAt,
  });

  factory NowPlayingResponse.fromJson(String str) =>
      NowPlayingResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NowPlayingResponse.fromMap(Map<String, dynamic> json) =>
      NowPlayingResponse(
        id: json["id"],
        imagen: json["imagen"],
        titulo: json["titulo"],
        url: json["url"],
        //        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "imagen": imagen,
    "titulo": titulo,
    "url": url,
    //    "updated_at": updatedAt,
    "created_at": createdAt,
  };
}
