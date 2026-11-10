import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const Movies testMovie = Movies(
  id: 'inception',
  name: 'Inception',
  age: '12A',
  year: '2010',
  date: 'Thursday 22 Oct 2026',
  runtime: '15:00',
  imagePath: 'assets/images/Inception.png',
  description: 'A thief enters dreams to steal information.',
  price: 6.0,
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });
}
