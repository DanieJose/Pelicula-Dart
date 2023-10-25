import 'dart:convert' show jsonDecode;
import "package:http/http.dart" as http;

class MovieService {
  final String apiKey = '949a2f50f45e8416b26133cd1df4c097';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final movies = List<Movie>.from(
          data['results'].map((movie) => Movie.fromJson(movie)));

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

class Movie {}
