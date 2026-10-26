class Program {
  const Program({
    required this.id,
    required this.title,
    required this.organization,
    required this.category,
    required this.location,
    required this.startDate,
    required this.deadline,
    required this.duration,
    required this.description,
    required this.eligibility,
    required this.status,
    required this.mode,
    required this.colorValue,
  });

  final String id;
  final String title;
  final String organization;
  final String category;
  final String location;
  final String startDate;
  final String deadline;
  final String duration;
  final String description;
  final List<String> eligibility;
  final String status;
  final String mode;
  final int colorValue;
}
