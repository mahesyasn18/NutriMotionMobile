class ScanModel {
  final String? barcode_number;

  ScanModel({
    this.barcode_number,
  });
  Map<String, dynamic> toJson() {
    return {
      'barcode_number': barcode_number,
    };
  }
}
