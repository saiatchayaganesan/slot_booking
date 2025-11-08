class Slot {
  final String id;
  final String city;
  final DateTime startTime;
  final DateTime endTime;
  bool isBooked;

  Slot({
    required this.id,
    required this.city,
    required this.startTime,
    required this.endTime,
    this.isBooked = false,
  });
}
