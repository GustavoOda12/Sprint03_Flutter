import 'package:flutter/material.dart';
import '../models/milk_bank.dart';
import '../theme/app_theme.dart';
import 'donation_form_screen.dart';

class BankDetailScreen extends StatelessWidget {
  final MilkBank bank;

  const BankDetailScreen({super.key, required this.bank});

  @override
  Widget build(BuildContext context) {
    final progressPercent =
        (bank.progress * 100).clamp(0, 100).toDouble().toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do banco')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.local_hospital_rounded,
                        color: AppColors.primary, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bank.name,
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 4),
                        Text('${bank.hospitalLink} • ${bank.city}/${bank.state}',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Estoque atual',
                              style: Theme.of(context).textTheme.titleMedium),
                          if (bank.isUrgent)
                            const Text('Necessidade urgente',
                                style: TextStyle(
                                    color: AppColors.danger,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: bank.progress.clamp(0, 1).toDouble(),
                          minHeight: 10,
                          backgroundColor: AppColors.border,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            bank.isUrgent
                                ? AppColors.danger
                                : AppColors.success,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${bank.currentStockLiters.toStringAsFixed(0)} L de '
                        '${bank.monthlyGoalLiters.toStringAsFixed(0)} L '
                        '($progressPercent% da meta mensal)',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('Sobre', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(bank.about, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              _InfoRow(icon: Icons.location_on_outlined, text: bank.address),
              _InfoRow(icon: Icons.access_time_rounded, text: bank.openingHours),
              _InfoRow(icon: Icons.phone_outlined, text: bank.phone),
              const SizedBox(height: 20),
              Text('Tipos aceitos',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: bank.acceptedTypes
                    .map(
                      (type) => Chip(
                        label: Text(type),
                        backgroundColor: AppColors.accent.withOpacity(0.1),
                        labelStyle: const TextStyle(color: AppColors.primaryDark),
                        side: BorderSide.none,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.volunteer_activism_rounded),
                  label: const Text('Doar para este banco'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DonationFormScreen(preselectedBank: bank),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.textMuted),
          const SizedBox(width: 10),
          Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}