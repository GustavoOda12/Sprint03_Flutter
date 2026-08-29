import 'package:flutter/material.dart';
import '../data/mock_donations.dart';
import '../theme/app_theme.dart';
import '../widgets/stat_pill.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final donor = mockDonor;

    return Scaffold(
      appBar: AppBar(title: const Text('Meu perfil')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          donor.name.substring(0, 1),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(donor.name,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 4),
                    Text(donor.badge,
                        style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  StatPill(
                    icon: Icons.water_drop_rounded,
                    value: '${donor.totalDonatedMl.toStringAsFixed(0)} ml',
                    label: 'Total doado',
                  ),
                  const SizedBox(width: 12),
                  StatPill(
                    icon: Icons.event_available_rounded,
                    value: '${donor.donationsCount}',
                    label: 'Doações',
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Text('Dados de contato',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              Card(
                child: Column(
                  children: [
                    _ProfileTile(icon: Icons.email_outlined, text: donor.email),
                    const Divider(height: 1),
                    _ProfileTile(icon: Icons.phone_outlined, text: donor.phone),
                    const Divider(height: 1),
                    _ProfileTile(
                        icon: Icons.location_on_outlined, text: donor.city),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Sair (protótipo)'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Funcionalidade de logout simulada — sem backend '
                          'nesta Sprint.',
                        ),
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

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ProfileTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(text),
    );
  }
}