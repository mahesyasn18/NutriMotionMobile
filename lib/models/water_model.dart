class WaterModel {
  final int? using_water;

  WaterModel({
    this.using_water,
  });
  Map<String, dynamic> toJson() {
    return {
      'barcode_number': using_water,
    };
  }
}
