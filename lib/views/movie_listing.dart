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
          children: [
            Text(
              'Inception',
              style: TextStyle(color: cinemaFontWhite
              ),
            )
          ],
            
          ),
        ),
      );
  }
}
