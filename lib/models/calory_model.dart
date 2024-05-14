class CaloryModel {
  final int total_kalori;

  CaloryModel({
    required this.total_kalori,
  });

  factory CaloryModel.fromJson(Map<String, dynamic> json) {
    return CaloryModel(
      total_kalori: json['total_kalori'] as int? ?? 0,
    );
  }
}
