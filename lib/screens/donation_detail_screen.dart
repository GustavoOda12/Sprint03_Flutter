import 'package:flutter/material.dart';
import '../models/donation.dart';
import '../theme/app_theme.dart';

class DonationDetailScreen extends StatelessWidget {
  final Donation donation;

  const DonationDetailScreen({super.key, required this.donation});

  Color _statusColor(BuildContext context) {
    switch (donation.status) {
      case DonationStatus.confirmada:
        return AppColors.success;
      case DonationStatus.coletada:
        return AppColors.accent;
      case DonationStatus.agendada:
        return AppColors.warning;
      case DonationStatus.cancelada:
        return AppColors.danger;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da doação')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.water_drop_rounded, color: color, size: 42),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  '${donation.volumeMl.toStringAsFixed(0)} ml',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    donation.status.label,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DetailRow(label: 'Banco de leite', value: donation.bankName),
                      _DetailRow(
                          label: 'Data prevista', value: donation.formattedDate),
                      _DetailRow(label: 'Código da doação', value: donation.id),
                      if (donation.notes.isNotEmpty)
                        _DetailRow(label: 'Observações', value: donation.notes),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}