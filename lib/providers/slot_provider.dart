import 'package:flutter/material.dart';
import '../models/slot_model.dart';

class SlotProvider extends ChangeNotifier {
  final List<Slot> _slots = [
    Slot(id: '1', city: 'Bangalore', startTime: DateTime(2025, 12, 29, 10, 0), endTime: DateTime(2025, 12, 29, 12, 0)),
    Slot(id: '2', city: 'Mumbai', startTime: DateTime(2025, 12, 27, 10, 0), endTime: DateTime(2025, 12, 27, 12, 0)),
    Slot(id: '3', city: 'Bangalore', startTime: DateTime(2025, 12, 31, 17, 30), endTime: DateTime(2025, 12, 31, 20, 0)),
    Slot(id: '4', city: 'Mumbai', startTime: DateTime(2025, 12, 20, 17, 30), endTime: DateTime(2025, 12, 20, 20, 0), isBooked: true),
  ];

  List<Slot> get slots => _slots;

  void markSlotAsBooked(String slotId) {
    final slot = _slots.firstWhere((s) => s.id == slotId);
    slot.isBooked = true;
    notifyListeners();
  }
}
