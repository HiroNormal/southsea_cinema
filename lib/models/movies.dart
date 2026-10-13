class Movies {
  final String id;
  final String name;
  final String age;
  final String year;
  final String date;
  final String runtime;
  final String imagePath;
  final String description;
  final double price;

  const Movies({
    required this.id,
    required this.name,
    required this.age,
    required this.year,
    required this.date,
    required this.runtime,
    required this.imagePath,
    required this.description,
    required this.price,
  });

  String get formattedPrice => '£${price.toStringAsFixed(2)}';

  bool get isChildFriendly => age == 'U' || age == 'PG';

  bool get isAdultOnly => age == '18';
}
