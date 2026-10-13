import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/movies_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  String? _orderFeedback;

  @override
  Widget build(BuildContext context) {
    final movie = MoviesRepository().getMovieById('inception')!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaFontWhite),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: cinemaSurface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${movie.name.toUpperCase()} (${movie.year}) (${movie.age})',
              style: const TextStyle(
                color: cinemaBrand,
                fontSize: 24
              ),
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
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${movie.date}, ${movie.runtime}',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Select Quantites (Up to 5 in total)',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Tickets',
              style: const TextStyle(
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
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: cinemaBrand,
                foregroundColor: cinemaFontWhite,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (_ticketQuantity == 1) {
                    _orderFeedback =
                        '$_ticketQuantity ticket added to your order.';
                  } else {
                    _orderFeedback =
                        '$_ticketQuantity tickets added to your order.';
                  }
                });
              },
              child: const Text('ADD TO ORDER'),
            ),
            if (_orderFeedback != null)
              Text(
                _orderFeedback!,
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
}
