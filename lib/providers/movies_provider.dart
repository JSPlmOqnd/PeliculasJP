import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fgc7_pelcls_109/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '19f3016803d4b165aee8a0c507db68ac';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formated response,
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = (nowPlayingResponse.results);
    //notificamos a todos los listeners si se produce algún cambio
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formated response,
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);
    // concatenado y desestructurado
    notifyListeners();
  }
}
