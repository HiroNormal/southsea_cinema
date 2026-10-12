import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movies_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

class MenuScreen extends StatelessWidget {
	const MenuScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final repository = MoviesRepository();
		final List<Movies> movies = repository.getMovies();

		return Scaffold(
			appBar: AppBar(
				title: const Text(appTitle, style: cinemaHeaderStyle),
				backgroundColor: cinemaSurface,
			),
			body: ListView.builder(
				itemCount: movies.length,
				itemBuilder: (context, index) {
					return MovieCard(movie: movies[index]);
				},
			),
		);
	}
}