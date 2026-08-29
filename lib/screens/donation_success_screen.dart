import 'package:flutter/material.dart';
import '../models/donation.dart';
import '../theme/app_theme.dart';
import '../navigation/main_navigation.dart';

class DonationSuccessScreen extends StatelessWidget {
  final Donation donation;

  const DonationSuccessScreen({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_rounded,
                    color: AppColors.success, size: 48),
              ),
              const SizedBox(height: 24),
              Text(
                'Doação agendada com sucesso!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                'Obrigada por ajudar a salvar vidas com o seu leite. '
                'A equipe de ${donation.bankName} entrará em contato para '
                'confirmar a coleta.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 28),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _SummaryRow(label: 'Banco', value: donation.bankName),
                      _SummaryRow(
                          label: 'Data prevista', value: donation.formattedDate),
                      _SummaryRow(
                          label: 'Volume',
                          value: '${donation.volumeMl.toStringAsFixed(0)} ml'),
                      _SummaryRow(
                          label: 'Status', value: donation.status.label,
                          isLast: true),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const MainNavigation()),
                      (route) => false,
                    );
                  },
                  child: const Text('Voltar para o início'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}