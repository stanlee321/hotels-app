class GuestRegistration {
  String? voucher;
  String? fullName;
  DateTime? checkIn;
  DateTime? checkOut;
  int adults;
  int children;
  String? phone;
  String? email;
  List<String> selectedActivities;
  double? budget;

  GuestRegistration({
    this.voucher,
    this.fullName,
    this.checkIn,
    this.checkOut,
    this.adults = 2,
    this.children = 0,
    this.phone,
    this.email,
    this.selectedActivities = const [],
    this.budget,
  });
} 
