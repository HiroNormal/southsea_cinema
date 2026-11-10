import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movies_repository.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieListing extends StatefulWidget {
  final String movieId;

  const MovieListing({super.key, this.movieId = defaultMovieId});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  String? _orderFeedback;
  late final Movies movie = MoviesRepository().getMovieById(widget.movieId)!;

  void _addToBasket() {
    if (_ticketQuantity == 0) {
      setState(() {
        _orderFeedback = 'Please select at least 1 ticket.';
      });
      return;
    }

    CartRepository.instance.addItem(
      CartItem(movie: movie, quantity: _ticketQuantity),
    );

    setState(() {
      if (_ticketQuantity == 1) {
        _orderFeedback = '1 ticket added to your basket.';
      } else {
        _orderFeedback = '$_ticketQuantity tickets added to your basket.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        actions: [
          const BasketButton(),
        ],
      ),
      drawer: const NavDrawer(),
      body: Container(
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
                '${movie.date}, ${movie.showTime}',
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
                'Select Quantites (Up to 5 in total)',
                textAlign: TextAlign.left,
                style: cinemaBodyStyle,
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
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
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'ADD TO BASKET',
                  onPressed: _addToBasket,
                ),
              ),
              const SizedBox(height: 12),
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
      ),
    );
  }
}
