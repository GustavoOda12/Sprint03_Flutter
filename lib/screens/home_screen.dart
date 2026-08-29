import 'package:flutter/material.dart';
import '../data/mock_donations.dart';
import '../data/mock_milk_banks.dart';
import '../theme/app_theme.dart';
import '../widgets/bank_card.dart';
import '../widgets/section_title.dart';
import '../widgets/stat_pill.dart';
import 'bank_detail_screen.dart';
import 'bank_list_screen.dart';
import 'donation_form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final urgentBanks =
        mockMilkBanks.where((bank) => bank.isUrgent).take(2).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Marina 👋'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primaryLight, AppColors.primaryDark],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sua doação pode alimentar até 10 bebês prematuros '
                      'por litro doado.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.4,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primaryDark,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const DonationFormScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Registrar nova doação'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  StatPill(
                    icon: Icons.water_drop_rounded,
                    value: '${mockDonor.totalDonatedMl.toStringAsFixed(0)} ml',
                    label: 'Total doado',
                  ),
                  const SizedBox(width: 12),
                  StatPill(
                    icon: Icons.check_circle_rounded,
                    value: '${mockDonor.donationsCount}',
                    label: 'Doações',
                  ),
                  const SizedBox(width: 12),
                  StatPill(
                    icon: Icons.workspace_premium_rounded,
                    value: mockDonor.badge.split(' ').last,
                    label: mockDonor.badge,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              SectionTitle(
                title: 'Bancos com necessidade urgente',
                actionLabel: 'Ver todos',
                onAction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const BankListScreen()),
                  );
                },
              ),
              ...urgentBanks.map(
                (bank) => BankCard(
                  bank: bank,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BankDetailScreen(bank: bank),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}