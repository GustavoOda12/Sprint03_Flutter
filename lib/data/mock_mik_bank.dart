import '../models/milk_bank.dart';

final List<MilkBank> mockMilkBanks = [
  const MilkBank(
    id: 'blh-001',
    name: 'Banco de Leite Humano Pérola Byington',
    hospitalLink: 'Hospital Pérola Byington',
    city: 'São Paulo',
    state: 'SP',
    address: 'Av. Brigadeiro Luís Antônio, 683 - Bela Vista',
    phone: '(11) 3324-9800',
    openingHours: 'Seg a Sex, 07h às 17h',
    currentStockLiters: 42,
    monthlyGoalLiters: 120,
    acceptedTypes: ['Leite ordenhado', 'Colostro'],
    about: 'Referência nacional em lactação humana, atende recém-nascidos '
        'prematuros internados na UTI neonatal.',
  ),
  const MilkBank(
    id: 'blh-002',
    name: 'Banco de Leite Humano Santa Casa',
    hospitalLink: 'Santa Casa de Misericórdia',
    city: 'Belo Horizonte',
    state: 'MG',
    address: 'Rua Domingos Vieira, 590 - Santa Efigênia',
    phone: '(31) 3238-8100',
    openingHours: 'Seg a Sáb, 08h às 18h',
    currentStockLiters: 95,
    monthlyGoalLiters: 100,
    acceptedTypes: ['Leite ordenhado'],
    about: 'Atende a maternidade da Santa Casa e hospitais parceiros da '
        'região metropolitana de Belo Horizonte.',
  ),
  const MilkBank(
    id: 'blh-003',
    name: 'Banco de Leite Humano IMIP',
    hospitalLink: 'Instituto de Medicina Integral Prof. Fernando Figueira',
    city: 'Recife',
    state: 'PE',
    address: 'Rua dos Coelhos, 300 - Boa Vista',
    phone: '(81) 2122-4100',
    openingHours: 'Todos os dias, 07h às 19h',
    currentStockLiters: 18,
    monthlyGoalLiters: 90,
    acceptedTypes: ['Leite ordenhado', 'Colostro'],
    about: 'Um dos maiores bancos de leite do Nordeste, com forte atuação em '
        'coleta domiciliar por meio de agentes de saúde.',
  ),
  const MilkBank(
    id: 'blh-004',
    name: 'Banco de Leite Humano Hospital de Clínicas',
    hospitalLink: 'Hospital de Clínicas de Porto Alegre',
    city: 'Porto Alegre',
    state: 'RS',
    address: 'Rua Ramiro Barcelos, 2350 - Santa Cecília',
    phone: '(51) 3359-8000',
    openingHours: 'Seg a Sex, 08h às 17h',
    currentStockLiters: 30,
    monthlyGoalLiters: 80,
    acceptedTypes: ['Leite ordenhado'],
    about: 'Trabalha em conjunto com a rede municipal de coleta domiciliar '
        'para abastecer a UTI neonatal do hospital.',
  ),
  const MilkBank(
    id: 'blh-005',
    name: 'Banco de Leite Humano Fernandes Figueira',
    hospitalLink: 'Instituto Fernandes Figueira - Fiocruz',
    city: 'Rio de Janeiro',
    state: 'RJ',
    address: 'Av. Rui Barbosa, 716 - Flamengo',
    phone: '(21) 2554-1700',
    openingHours: 'Seg a Sex, 07h às 16h',
    currentStockLiters: 60,
    monthlyGoalLiters: 110,
    acceptedTypes: ['Leite ordenhado', 'Colostro'],
    about: 'Centro de referência em neonatologia com equipe dedicada de '
        'consultoras em amamentação.',
  ),
];

MilkBank? findMilkBankById(String id) {
  try {
    return mockMilkBanks.firstWhere((bank) => bank.id == id);
  } catch (_) {
    return null;
  }
}