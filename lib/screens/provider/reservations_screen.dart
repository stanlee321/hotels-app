import 'package:flutter/material.dart';

enum ReservationStatus {
  VGHT,
  RTRS,
  ESPR,
}

Color _getStatusColor(ReservationStatus status) {
  switch (status) {
    case ReservationStatus.VGHT:
      return Colors.green;
    case ReservationStatus.RTRS:
      return Colors.red;
    case ReservationStatus.ESPR:
      return Colors.orange;
  }
}

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  _ReservationsScreenState createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Reservas'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _mockReservations.length,
        itemBuilder: (context, index) {
          final reservation = _mockReservations[index];
          return ReservationCard(
            reservation: reservation,
            onStatusChanged: (ReservationStatus newStatus) {
              setState(() {
                _mockReservations[index] = reservation.copyWith(status: newStatus);
              });
              _showStatusChangeConfirmation(context, reservation, newStatus);
            },
          );
        },
      ),
    );
  }

  void _showStatusChangeConfirmation(
    BuildContext context,
    Reservation reservation,
    ReservationStatus newStatus,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Estado actualizado a: ${_getStatusText(newStatus)}',
        ),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {
            setState(() {
              _mockReservations[_mockReservations.indexOf(reservation)] =
                  reservation.copyWith(status: reservation.status);
            });
          },
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  final Function(ReservationStatus) onStatusChanged;

  const ReservationCard({
    Key? key,
    required this.reservation,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => _showDetailsDialog(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                reservation.hotelName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text('Cliente: ${reservation.clientName}'),
              trailing: _getStatusChip(reservation.status),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStatusChip(ReservationStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getStatusColor(status).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getStatusColor(status)),
      ),
      child: Text(
        _getStatusText(status),
        style: TextStyle(
          color: _getStatusColor(status),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ReservationDetailsDialog(
        reservation: reservation,
        onStatusChanged: onStatusChanged,
      ),
    );
  }
}

class ReservationDetailsDialog extends StatefulWidget {
  final Reservation reservation;
  final Function(ReservationStatus) onStatusChanged;

  const ReservationDetailsDialog({
    Key? key,
    required this.reservation,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  _ReservationDetailsDialogState createState() => _ReservationDetailsDialogState();
}

class _ReservationDetailsDialogState extends State<ReservationDetailsDialog> {
  late ReservationStatus selectedStatus;
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.reservation.status;
    phoneController.text = "123-456-7890"; // Mock phone number
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.reservation.clientName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 24),
            const Text(
              'Estado:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ReservationStatus.values.map((status) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedStatus = status;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedStatus == status
                        ? _getStatusColor(status)
                        : Colors.grey.shade200,
                    foregroundColor: selectedStatus == status
                        ? Colors.white
                        : Colors.black87,
                  ),
                  child: Text(_getStatusText(status)),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implementar llamada
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text('Llamar'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implementar No Show
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.warning),
                  label: const Text('No Show'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedStatus != widget.reservation.status) {
                        widget.onStatusChanged(selectedStatus);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Guardar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  String _getStatusText(ReservationStatus status) {
    switch (status) {
      case ReservationStatus.VGHT:
        return 'Vigente';
      case ReservationStatus.RTRS:
        return 'Retrasado';
      case ReservationStatus.ESPR:
        return 'En espera';
    }
  }
}

// Mock data
class Reservation {
  final String hotelName;
  final String clientName;
  final ReservationStatus status;

  Reservation({
    required this.hotelName,
    required this.clientName,
    required this.status,
  });

  Reservation copyWith({
    String? hotelName,
    String? clientName,
    ReservationStatus? status,
  }) {
    return Reservation(
      hotelName: hotelName ?? this.hotelName,
      clientName: clientName ?? this.clientName,
      status: status ?? this.status,
    );
  }
}

final List<Reservation> _mockReservations = [
  Reservation(
    hotelName: 'Hotel Ejemplo 1',
    clientName: 'Juan Pérez',
    status: ReservationStatus.VGHT,
  ),
  Reservation(
    hotelName: 'Hotel Ejemplo 1',
    clientName: 'María García',
    status: ReservationStatus.RTRS,
  ),
  Reservation(
    hotelName: 'Hotel Ejemplo 2',
    clientName: 'Carlos López',
    status: ReservationStatus.ESPR,
  ),
];

String _getStatusText(ReservationStatus status) {
  switch (status) {
    case ReservationStatus.VGHT:
      return 'Vigente';
    case ReservationStatus.RTRS:
      return 'Retrasado';
    case ReservationStatus.ESPR:
      return 'En espera';
  }
} 
