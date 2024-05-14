class GoalModel {
  final int kalori;
  final String message;

  GoalModel({
    required this.kalori,
    required this.message,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      kalori: json['kalori'] as int? ?? 0,
      message: json['message'] as String? ?? '',
    );
  }
}
