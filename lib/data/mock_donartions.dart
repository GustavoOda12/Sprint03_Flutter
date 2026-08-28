import '../models/donation.dart';
import '../models/donor.dart';

final Donor mockDonor = Donor(
  name: 'Marina Souza',
  email: 'marina.souza@email.com',
  phone: '(11) 98877-6655',
  city: 'São Paulo - SP',
  totalDonatedMl: 3200,
  donationsCount: 4,
);

final List<Donation> mockDonations = [
  Donation(
    id: 'd-001',
    bankId: 'blh-001',
    bankName: 'Banco de Leite Humano Pérola Byington',
    scheduledDate: DateTime(2026, 6, 12),
    volumeMl: 800,
    status: DonationStatus.confirmada,
    notes: 'Coleta realizada em domicílio pela equipe do banco.',
  ),
  Donation(
    id: 'd-002',
    bankId: 'blh-001',
    bankName: 'Banco de Leite Humano Pérola Byington',
    scheduledDate: DateTime(2026, 7, 3),
    volumeMl: 650,
    status: DonationStatus.confirmada,
  ),
  Donation(
    id: 'd-003',
    bankId: 'blh-005',
    bankName: 'Banco de Leite Humano Fernandes Figueira',
    scheduledDate: DateTime(2026, 8, 10),
    volumeMl: 900,
    status: DonationStatus.coletada,
    notes: 'Aguardando pasteurização e liberação para uso.',
  ),
  Donation(
    id: 'd-004',
    bankId: 'blh-002',
    bankName: 'Banco de Leite Humano Santa Casa',
    scheduledDate: DateTime(2026, 9, 2),
    volumeMl: 850,
    status: DonationStatus.agendada,
    notes: 'Coleta agendada com a equipe de enfermagem.',
  ),
];