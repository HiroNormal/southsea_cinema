import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movies.dart';

class MoviesRepository {
  List<Movies>? _cachedMovies;

  List<Movies> getMovies() {
    final List<Movies>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }

    return const [
      Movies(
          id: 'inception',
          name: 'Inception',
          age: '12A',
          year: '2010',
          runtime: '15:00',
          date: 'Thursday 22 Oct 2026',
          imagePath: 'assets/images/inception.png',
          description:
              "Cobb steals information from his targets by entering their dreams. He is wanted for his alleged role in his wife's murder and his only chance at redemption is to perform a nearly impossible task.",
          price: 6.00),
      Movies(
          id: 'the-thing',
          name: 'The Thing',
          age: '15',
          year: '1982',
          runtime: '15:00',
          date: 'Thursday 29 Oct 2026',
          imagePath: 'assets/images/thing.jpg',
          description:
              'A research team finds an alien being that has fallen from the sky and is starting to hunt them down. Things take a sinister turn when they realise that the creature can take the shape of its victims.',
          price: 6.00)
    ];
  }

  Movies? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  Future<List<Movies>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movies> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movies movie = Movies.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
}
