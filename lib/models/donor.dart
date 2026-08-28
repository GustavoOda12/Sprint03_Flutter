class Donor {
  final String name;
  final String email;
  final String phone;
  final String city;
  final double totalDonatedMl;
  final int donationsCount;

  const Donor({
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.totalDonatedMl,
    required this.donationsCount,
  });

  String get badge {
    if (totalDonatedMl >= 5000) return 'Doadora Ouro';
    if (totalDonatedMl >= 2000) return 'Doadora Prata';
    if (totalDonatedMl > 0) return 'Doadora Bronze';
    return 'Nova Doadora';
  }
}