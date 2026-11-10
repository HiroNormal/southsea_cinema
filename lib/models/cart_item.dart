import 'package:southsea_cinema/models/movies.dart';

class CartItem {
  final Movies movie;
  final int quantity;

  const CartItem({
    required this.movie,
    required this.quantity,
  });

  double get lineTotal {
    return movie.price * quantity;
  }
}
