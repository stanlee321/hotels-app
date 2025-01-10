class Activity {
  final int id;
  final String name;
  final String subtitle;
  final double rating;
  final double price;
  final String imageUrl;
  bool isFavorite;
  final String provider;
  final String address;
  final String schedule;
  final String availability;

  Activity({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.provider = 'Turismo Nuevo León',
    this.address = '',
    this.schedule = '09:00 - 18:00',
    this.availability = 'Todo el año',
  });
} 
