class ActivityDetailFormModel {
  final String durasi;
  final String total_kalori;
  final String waktu;
  final String jenis_activity;

  ActivityDetailFormModel({
    required this.durasi,
    required this.total_kalori,
    required this.waktu,
    required this.jenis_activity,
  });

  Map<String, dynamic> toJson() {
    return {
      'durasi': durasi,
      'total_kalori': total_kalori,
      'waktu': waktu,
      'jenis_activity': jenis_activity,
    };
  }
}
