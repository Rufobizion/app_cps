import 'dart:convert';
//import 'package:flutter_cps/models/now_playing_response.dart';
import 'package:flutter/material.dart';
import 'package:cps_ipn_app/models/models.dart';
import 'package:http/http.dart' as http;

class SliderProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  // final String _baseURL = 'rufolabs.net';
  //
  final String _supabaseUrl = 'nuerubnfcivddxflfwls.supabase.co';
  final String _anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51ZXJ1Ym5mY2l2ZGR4Zmxmd2xzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1NTU0MDI5MCwiZXhwIjoyMDcxMTE2MjkwfQ.xyZVXZjABezJQwFYT5YmfZlbUOtOtRZW01PWNM4qUUw';

  List<NowPlayingResponse> onDisplaySlider = [];
  List<CategoriaResponse> onDisplayCategoria = [];
  List<ComitesResponse> onDisplayComites = [];
  List<RevistaResponse> onDisplayRevista = [];
  List<VariosResponse> onDisplayVarios = [];

  SliderProvider() {
    // print('inicializando privider');
    getOnDisplayImages();
    getCategorias();
    getComites();
    getRevista();
    getVarios();
  }

  getOnDisplayImages() async {
    //   print("Aqui ya entramos alDisplay");
    // var url = Uri.https(_baseURL, '/cpsapi/slider');
    var url = Uri.https(_supabaseUrl, '/rest/v1/slider');

    final response = await http.get(
      url,
      headers: {
        'apikey': _anonKey,
        'Authorization': 'Bearer $_anonKey',
        'Accept': 'application/json',
      },
    );
    //print(response.body);
    // final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    final List<dynamic> jsonList = jsonDecode(response.body);
    onDisplaySlider = jsonList
        .map((item) => NowPlayingResponse.fromMap(item))
        .toList();
    //print(onDisplaySlider);
    notifyListeners();
    //  final nowresponse = NowPlayingResponse.fromJson(response.body);
  }

  getCategorias() async {
    //   print("Aqui ya entramos alDisplay");
    var url = Uri.https(_supabaseUrl, '/rest/v1/categoria');
    // var url = Uri.https(_baseURL, '/cpsapi/categoria');

    final response = await http.get(
      url,
      headers: {
        'apikey': _anonKey,
        'Authorization': 'Bearer $_anonKey',
        'Accept': 'application/json',
      },
    );
    //   print(response.body);
    // final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    final List<dynamic> jsonList2 = jsonDecode(response.body);
    onDisplayCategoria = jsonList2
        .map((item) => CategoriaResponse.fromMap(item))
        .toList();
    notifyListeners();
    //  print(onDisplaySlider);
    //  final nowresponse = NowPlayingResponse.fromJson(response.body);
  }

  getComites() async {
    //   print("Aqui ya entramos alDisplay");
    var url = Uri.https(_supabaseUrl, '/rest/v1/comites');
    // var url = Uri.https(_baseURL, '/cpsapi/comites');

    final response = await http.get(
      url,
      headers: {
        'apikey': _anonKey,
        'Authorization': 'Bearer $_anonKey',
        'Accept': 'application/json',
      },
    );

    ///print(response.body);
    // final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    final List<dynamic> jsonList2 = jsonDecode(response.body);

    onDisplayComites = jsonList2
        .map((item) => ComitesResponse.fromMap(item))
        .toList();

    notifyListeners();
    //  print(onDisplaySlider);
    //  final nowresponse = NowPlayingResponse.fromJson(response.body);
  }

  getRevista() async {
    //   print("Aqui ya entramos alDisplay");
    var url = Uri.https(_supabaseUrl, '/rest/v1/revista');
    // var url = Uri.https(_baseURL, '/cpsapi/revista');

    final response = await http.get(
      url,
      headers: {
        'apikey': _anonKey,
        'Authorization': 'Bearer $_anonKey',
        'Accept': 'application/json',
      },
    );
    //print(response);
    final List<dynamic> jsonList3 = jsonDecode(response.body);
    //print(response.body);
    onDisplayRevista = jsonList3
        .map((item) => RevistaResponse.fromMap(item))
        .toList();

    notifyListeners();
  }

  getVarios() async {
    //   print("Aqui ya entramos alDisplay");
    var url = Uri.https(_supabaseUrl, '/rest/v1/varios');
    // var url = Uri.https(_baseURL, '/cpsapi/revista');

    final response = await http.get(
      url,
      headers: {
        'apikey': _anonKey,
        'Authorization': 'Bearer $_anonKey',
        'Accept': 'application/json',
      },
    );
    //print(response);
    final List<dynamic> jsonList4 = jsonDecode(response.body);
    //print(response.body);
    onDisplayVarios = jsonList4
        .map((item) => VariosResponse.fromMap(item))
        .toList();

    notifyListeners();
  }
}

/*class SupabaseServiceSlider {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getSlider() async {
    final response = await supabase.from('slider').select('*');
    return response; // es una lista de mapas
  }
}
*/
