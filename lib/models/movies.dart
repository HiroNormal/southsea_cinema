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

  factory Movies.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String name = json['name'] as String;
    final String age = json['age'] as String;
    final String year = json['year'] as String;
    final String date = json['date'] as String;
    final String runtime = json['runtime'] as String;
    final String imagePath = json['imagePath'] as String;
    final String description = json['description'] as String;
    final num priceNumber = json['price'] as num;
    final double price = priceNumber.toDouble();

    return Movies(
      id: id,
      name: name,
      age: age,
      year: year,
      date: date,
      runtime: runtime,
      imagePath: imagePath,
      description: description,
      price: price,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'year': year,
      'date': date,
      'runtime': runtime,
      'imagePath': imagePath,
      'description': description,
      'price': price,
    };
    return data;
  }

  String get formattedPrice => '£${price.toStringAsFixed(2)}';

  bool get isChildFriendly => age == 'U' || age == 'PG';

  bool get isAdultOnly => age == '18';
}
