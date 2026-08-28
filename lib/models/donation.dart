enum DonationStatus { agendada, coletada, confirmada, cancelada }

extension DonationStatusLabel on DonationStatus {
  String get label {
    switch (this) {
      case DonationStatus.agendada:
        return 'Agendada';
      case DonationStatus.coletada:
        return 'Coletada';
      case DonationStatus.confirmada:
        return 'Confirmada';
      case DonationStatus.cancelada:
        return 'Cancelada';
    }
  }
}

class Donation {
  final String id;
  final String bankId;
  final String bankName;
  final DateTime scheduledDate;
  final double volumeMl;
  final DonationStatus status;
  final String notes;

  const Donation({
    required this.id,
    required this.bankId,
    required this.bankName,
    required this.scheduledDate,
    required this.volumeMl,
    required this.status,
    this.notes = '',
  });

  Donation copyWith({
    DonationStatus? status,
  }) {
    return Donation(
      id: id,
      bankId: bankId,
      bankName: bankName,
      scheduledDate: scheduledDate,
      volumeMl: volumeMl,
      status: status ?? this.status,
      notes: notes,
    );
  }

  String get formattedDate {
    const meses = [
      'jan', 'fev', 'mar', 'abr', 'mai', 'jun',
      'jul', 'ago', 'set', 'out', 'nov', 'dez'
    ];
    return '${scheduledDate.day.toString().padLeft(2, '0')} '
        '${meses[scheduledDate.month - 1]} ${scheduledDate.year}';
  }
}