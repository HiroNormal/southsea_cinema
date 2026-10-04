import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cinemaSurface,
          border: Border.all(
            color: cinemaBrand,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inception',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Runtime: 2h 28m',
                  style: TextStyle(
                    color: cinemaFontMuted,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Age rating: 12A',
                  style: TextStyle(
                    color: cinemaFontMuted,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Cobb steals information from his targets by entering their dreams. He is wanted for his alleged role in his wife\'s murder and his only chance at redemption is to perform a nearly impossible task.',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: cinemaFontMuted,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
