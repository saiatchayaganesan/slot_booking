import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/slot_provider.dart';
import '../models/slot_model.dart';

class SlotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventName = ModalRoute.of(context)!.settings.arguments as String;
    final slots = Provider.of<SlotProvider>(context).slots.where((s) =>
    eventName == "Fan Meet" ? s.startTime.day <= 29 : s.startTime.day >= 31).toList();

    return Scaffold(
      appBar: AppBar(title: Text("$eventName Slots"), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: slots.length,
          itemBuilder: (context, index) {
            final slot = slots[index];
            return Card(
              color: slot.isBooked ? Colors.grey[300] : Colors.purple[100],
              child: ListTile(
                title: Text("${slot.city} - ${slot.startTime.day}/${slot.startTime.month} at ${slot.startTime.hour}:${slot.startTime.minute.toString().padLeft(2, '0')}"),
                subtitle: Text(slot.isBooked ? "Booked" : "Available"),
                onTap: slot.isBooked
                    ? null
                    : () {
                  if (eventName == "Live Concert") {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Choose Ticket Type"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildTicketButton(context, "VIP", 10000, slot),
                            _buildTicketButton(context, "Premium", 5000, slot),
                            _buildTicketButton(context, "General", 3000, slot),
                          ],
                        ),
                      ),
                    );
                  } else {
                    Navigator.pushNamed(context, '/payment', arguments: {"slot": slot, "type": "Fan Meet", "amount": 1000});
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTicketButton(BuildContext context, String type, int amount, Slot slot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/payment', arguments: {"slot": slot, "type": type, "amount": amount});
        },
        child: Text("$type - ₹$amount"),
      ),
    );
  }
}
