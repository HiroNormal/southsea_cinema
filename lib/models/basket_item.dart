import 'package:southsea_cinema/models/movies.dart';

class BasketItem {
  final Movies movie;
  final int quantity;

  const BasketItem({
    required this.movie,
    required this.quantity,
  });

  double get lineTotal {
    return movie.price * quantity;
  }
}
