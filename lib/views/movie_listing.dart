import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String? _orderFeedback;

  @override
  Widget build(BuildContext context) {
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
        decoration: BoxDecoration(
          color: cinemaSurface,
          border: Border.all(
            color: cinemaFontWhite,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INCEPTION (2010) (12A)',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 24
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Southsea Cinema Room',
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Cobb steals information from his targets by entering their dreams. He is wanted for his alleged role in his wife\'s murder and his only chance at redemption is to perform a nearly impossible task.',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
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
                    for (var quantity = 1; quantity <= 5; quantity++)
                      DropdownMenuItem(
                        value: quantity,
                        child: Text('$quantity'),
                      ),
                  ],
                ),
              ),
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
                  final ticketLabel =
                      _ticketQuantity == 1 ? 'ticket' : 'tickets';
                  _orderFeedback =
                      '$_ticketQuantity $ticketLabel added to your order.';
                });
              },
              child: const Text('ADD TO ORDER'),
            ),
            if (_orderFeedback != null) ...[
              const SizedBox(height: 10),
              Text(
                _orderFeedback!,
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 15,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
