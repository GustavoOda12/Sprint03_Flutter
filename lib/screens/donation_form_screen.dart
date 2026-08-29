import 'package:flutter/material.dart';
import '../data/mock_donations.dart';
import '../data/mock_milk_banks.dart';
import '../models/donation.dart';
import '../models/milk_bank.dart';
import 'donation_success_screen.dart';

class DonationFormScreen extends StatefulWidget {
  final MilkBank? preselectedBank;

  const DonationFormScreen({super.key, this.preselectedBank});

  @override
  State<DonationFormScreen> createState() => _DonationFormScreenState();
}

class _DonationFormScreenState extends State<DonationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _volumeController = TextEditingController();
  final _notesController = TextEditingController();

  MilkBank? _selectedBank;
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 3));

  @override
  void initState() {
    super.initState();
    _selectedBank = widget.preselectedBank ?? mockMilkBanks.first;
  }

  @override
  void dispose() {
    _volumeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate() || _selectedBank == null) return;

    final newDonation = Donation(
      id: 'd-${mockDonations.length + 1}'.padLeft(4, '0'),
      bankId: _selectedBank!.id,
      bankName: _selectedBank!.name,
      scheduledDate: _selectedDate,
      volumeMl: double.parse(_volumeController.text.replaceAll(',', '.')),
      status: DonationStatus.agendada,
      notes: _notesController.text.trim(),
    );

    mockDonations.insert(0, newDonation);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => DonationSuccessScreen(donation: newDonation),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova doação')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                'Preencha os dados abaixo para agendar a coleta da sua '
                'doação de leite materno.',
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<MilkBank>(
                value: _selectedBank,
                decoration: const InputDecoration(labelText: 'Banco de leite'),
                items: mockMilkBanks
                    .map(
                      (bank) => DropdownMenuItem(
                        value: bank,
                        child: Text(
                          bank.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (bank) => setState(() => _selectedBank = bank),
                validator: (value) =>
                    value == null ? 'Selecione um banco de leite' : null,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Data prevista para coleta',
                    suffixIcon: Icon(Icons.calendar_today_rounded, size: 20),
                  ),
                  child: Text(
                    '${_selectedDate.day.toString().padLeft(2, '0')}/'
                    '${_selectedDate.month.toString().padLeft(2, '0')}/'
                    '${_selectedDate.year}',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _volumeController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Volume estimado (ml)',
                  hintText: 'Ex: 500',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o volume estimado';
                  }
                  final parsed = double.tryParse(value.replaceAll(',', '.'));
                  if (parsed == null || parsed <= 0) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Observações (opcional)',
                  hintText: 'Ex: melhor horário para coleta, ponto de referência...',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Confirmar doação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}