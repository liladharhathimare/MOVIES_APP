import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutflix/constants.dart';
import 'package:flutflix/models/movie.dart'; // Adjust path as needed

class Api {
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apikey}';
  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}';

  static const upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apikey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;

      return decodeData.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('something happened');
    }
  }
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;

      return decodeData.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('something happened');
    }
  }
  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upcomingUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;

      return decodeData.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('something happened');
    }
  }
}

