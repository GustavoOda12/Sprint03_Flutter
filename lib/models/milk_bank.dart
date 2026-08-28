class MilkBank {
  final String id;
  final String name;
  final String hospitalLink;
  final String city;
  final String state;
  final String address;
  final String phone;
  final String openingHours;
  final double currentStockLiters;
  final double monthlyGoalLiters;
  final List<String> acceptedTypes;
  final String about;

  const MilkBank({
    required this.id,
    required this.name,
    required this.hospitalLink,
    required this.city,
    required this.state,
    required this.address,
    required this.phone,
    required this.openingHours,
    required this.currentStockLiters,
    required this.monthlyGoalLiters,
    required this.acceptedTypes,
    required this.about,
  });

  double get progress => monthlyGoalLiters == 0
      ? 0
      : (currentStockLiters / monthlyGoalLiters).clamp(0, 1.5).toDouble();

  bool get isUrgent => progress < 0.4;
}