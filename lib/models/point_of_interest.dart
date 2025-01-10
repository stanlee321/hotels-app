class PointOfInterest {
  final int id;
  final String name;
  final String type;
  final double latitude;
  final double longitude;

  PointOfInterest({
    required this.id,
    required this.name,
    required this.type,
    required this.latitude,
    required this.longitude,
  });

  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    return PointOfInterest(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
} 
