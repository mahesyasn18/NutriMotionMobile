class DetailActivityModel {
  final int id;
  final int durasi;
  final int total_kalori;
  final String waktu;
  final String activity_name;
  final String photo;
  final String message;

  DetailActivityModel({
    required this.message,
    required this.id,
    required this.durasi,
    required this.total_kalori,
    required this.waktu,
    required this.activity_name,
    required this.photo,
  });

  factory DetailActivityModel.fromJson(Map<String, dynamic> json) {
    return DetailActivityModel(
      id: json['id'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      total_kalori: json['total_kalori'] as int? ?? 0,
      durasi: json['durasi'] as int? ?? 0,
      waktu: json['waktu'] as String? ?? '',
      activity_name: json['activity_name'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
    );
  }
}
