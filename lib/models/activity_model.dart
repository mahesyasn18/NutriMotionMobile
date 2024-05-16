class ActivityModel {
  final int id;
  final String activityName;
  final int jumlahKaloriRendah;
  final int jumlahKaloriSedang;
  final int jumlahKaloriTinggi;
  final String photo;

  ActivityModel({
    required this.id,
    required this.activityName,
    required this.jumlahKaloriRendah,
    required this.jumlahKaloriSedang,
    required this.jumlahKaloriTinggi,
    required this.photo,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      activityName: json['activity_name'],
      jumlahKaloriRendah: json['jumlah_kalori_rendah'],
      jumlahKaloriSedang: json['jumlah_kalori_sedang'],
      jumlahKaloriTinggi: json['jumlah_kalori_tinggi'],
      photo: json['photo'],
    );
  }
}
