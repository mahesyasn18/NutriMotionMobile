class ScansModel {
  final bool? is_barcode_exist;
  final String? food_name;
  final String? barcode_number;

  ScansModel({
    this.is_barcode_exist,
    this.food_name,
    this.barcode_number,
  });

  factory ScansModel.fromJson(Map<String, dynamic> json) => ScansModel(
        is_barcode_exist: json['is_barcode_exist'],
        food_name: json['food_name'],
        barcode_number: json['barcode_number'],
      );
}
