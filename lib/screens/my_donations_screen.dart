import 'package:flutter/material.dart';
import '../data/mock_donations.dart';
import '../widgets/donation_card.dart';
import 'donation_detail_screen.dart';
import 'donation_form_screen.dart';

class MyDonationsScreen extends StatelessWidget {
  const MyDonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas doações')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const DonationFormScreen()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Nova doação'),
      ),
      body: SafeArea(
        child: mockDonations.isEmpty
            ? const Center(child: Text('Você ainda não registrou doações.'))
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 90),
                itemCount: mockDonations.length,
                itemBuilder: (context, index) {
                  final donation = mockDonations[index];
                  return DonationCard(
                    donation: donation,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              DonationDetailScreen(donation: donation),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}