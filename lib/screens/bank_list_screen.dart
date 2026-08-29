import 'package:flutter/material.dart';
import '../data/mock_milk_banks.dart';
import '../models/milk_bank.dart';
import '../widgets/bank_card.dart';
import 'bank_detail_screen.dart';

class BankListScreen extends StatefulWidget {
  const BankListScreen({super.key});

  @override
  State<BankListScreen> createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  String _query = '';

  List<MilkBank> get _filteredBanks {
    if (_query.trim().isEmpty) return mockMilkBanks;
    final q = _query.toLowerCase();
    return mockMilkBanks
        .where((bank) =>
            bank.name.toLowerCase().contains(q) ||
            bank.city.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final banks = _filteredBanks;

    return Scaffold(
      appBar: AppBar(title: const Text('Bancos de Leite')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Buscar por nome ou cidade...',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) => setState(() => _query = value),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: banks.isEmpty
                    ? const Center(
                        child: Text('Nenhum banco de leite encontrado.'),
                      )
                    : ListView.builder(
                        itemCount: banks.length,
                        itemBuilder: (context, index) {
                          final bank = banks[index];
                          return BankCard(
                            bank: bank,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      BankDetailScreen(bank: bank),
                                ),
                              );
                            },
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