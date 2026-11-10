import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movies_repository.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieListing extends StatefulWidget {
  final String movieId;

  const MovieListing({super.key, this.movieId = 'inception'});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  String? _bookingFeedback;
  Movies? _movie;
  bool _loading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadMovie();
  }

  Future<void> _loadMovie() async {
    try {
      final MoviesRepository repository = MoviesRepository();
      await repository.loadMoviesFromAsset();
      final Movies? movie = repository.getMovieById(widget.movieId);
      if (!mounted) {
        return;
      }
      setState(() {
        if (movie == null) {
          _errorMessage = 'Could not find the film "${widget.movieId}".';
        } else {
          _movie = movie;
        }
        _loading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _errorMessage = 'Could not load the film: $error';
        _loading = false;
      });
    }
  }

  void _addToBasket() {
    final Movies movie = _movie!;

    if (_ticketQuantity == 0) {
      setState(() {
        _bookingFeedback = 'Please select at least 1 ticket.';
      });
      return;
    }

    CartRepository.instance.addItem(
      CartItem(movie: movie, quantity: _ticketQuantity),
    );

    setState(() {
      if (_ticketQuantity == 1) {
        _bookingFeedback = '1 ticket added to your basket.';
      } else {
        _bookingFeedback = '$_ticketQuantity tickets added to your basket.';
      }
    });
  }

  Widget _buildDetails(Movies movie) {
    return Container(
      color: cinemaSurface,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${movie.name.toUpperCase()} (${movie.year}) (${movie.age})',
              style: const TextStyle(color: cinemaBrand, fontSize: 24),
            ),
            const SizedBox(height: 12),
            Image.asset(
              movie.imagePath,
              width: 140,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            const Text(
              'Southsea Cinema Room',
              style: cinemaBodyStyle,
            ),
            const SizedBox(height: 12),
            Text(
              '${movie.date}, ${movie.runtime}',
              style: cinemaBodyStyle,
            ),
            const SizedBox(height: 40),
            const Text(
              'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets',
              textAlign: TextAlign.left,
              style: cinemaBodyStyle,
            ),
            const SizedBox(height: 24),
            const Text(
              'Select Quantities (Up to 5 in total)',
              textAlign: TextAlign.left,
              style: cinemaBodyStyle,
            ),
            const SizedBox(height: 24),
            const Text(
              'Tickets',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: cinemaFontWhite,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: _ticketQuantity,
                      isExpanded: true,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      dropdownColor: cinemaFontWhite,
                      iconEnabledColor: Colors.black,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() {
                            _ticketQuantity = value;
                          });
                        }
                      },
                      items: [
                        for (int quantity = 0; quantity <= 5; quantity++)
                          DropdownMenuItem(
                            value: quantity,
                            child: Text('$quantity'),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Adult (${movie.formattedPrice})',
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: 'ADD TO BASKET',
                onPressed: _addToBasket,
              ),
            ),
            const SizedBox(height: 12),
            if (_bookingFeedback != null)
              Text(
                _bookingFeedback!,
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 15,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (_loading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (_errorMessage.isNotEmpty) {
      body = Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(_errorMessage, style: cinemaBodyStyle),
        ),
      );
    } else {
      body = _buildDetails(_movie!);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      drawer: const NavDrawer(),
      body: body,
    );
  }
}
