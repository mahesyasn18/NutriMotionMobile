class ProductModel {
  final int? id;
  final String? brand;
  final String? foodName;
  final String? foodType;
  final String? size;
  final String? barcodeNumber;
  final int? kalori;
  final String? lemakTotal;
  final String? lemakJenuh;
  final String? protein;
  final String? karbohidratTotal;
  final String? gula;
  final String? garam;
  final String? serat;
  final String? vitA;
  final String? vitD;
  final String? vitE;
  final String? vitK;
  final String? vitB1;
  final String? vitB2;
  final String? vitB3;
  final String? vitB5;
  final String? vitB6;
  final String? folat;
  final String? vitB12;
  final String? biotin;
  final String? kolin;
  final String? vitC;
  final String? kalsium;
  final String? fosfor;
  final String? magnesium;
  final String? natrium;
  final String? kalium;
  final String? mangan;
  final String? tembaga;
  final String? kromium;
  final String? besi;
  final String? iodium;
  final String? seng;
  final String? selenium;
  final String? fluor;

  ProductModel({
    this.id,
    this.brand,
    this.foodName,
    this.foodType,
    this.size,
    this.barcodeNumber,
    this.kalori,
    this.lemakTotal,
    this.lemakJenuh,
    this.protein,
    this.karbohidratTotal,
    this.gula,
    this.garam,
    this.serat,
    this.vitA,
    this.vitD,
    this.vitE,
    this.vitK,
    this.vitB1,
    this.vitB2,
    this.vitB3,
    this.vitB5,
    this.vitB6,
    this.folat,
    this.vitB12,
    this.biotin,
    this.kolin,
    this.vitC,
    this.kalsium,
    this.fosfor,
    this.magnesium,
    this.natrium,
    this.kalium,
    this.mangan,
    this.tembaga,
    this.kromium,
    this.besi,
    this.iodium,
    this.seng,
    this.selenium,
    this.fluor,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        brand: json['brand'],
        foodName: json['food_name'],
        foodType: json['food_type'],
        size: json['size'],
        barcodeNumber: json['barcode_number'],
        kalori: json['kalori'],
        lemakTotal: json['lemak_total'],
        lemakJenuh: json['lemak_jenuh'],
        protein: json['protein'],
        karbohidratTotal: json['karbohidrat_total'],
        gula: json['gula'],
        garam: json['garam'],
        serat: json['serat'],
        vitA: json['vit_a'],
        vitD: json['vit_d'],
        vitE: json['vit_e'],
        vitK: json['vit_k'],
        vitB1: json['vit_b1'],
        vitB2: json['vit_b2'],
        vitB3: json['vit_b3'],
        vitB5: json['vit_b5'],
        vitB6: json['vit_b6'],
        folat: json['folat'],
        vitB12: json['vit_b12'],
        biotin: json['biotin'],
        kolin: json['kolin'],
        vitC: json['vit_c'],
        kalsium: json['kalsium'],
        fosfor: json['fosfor'],
        magnesium: json['magnesium'],
        natrium: json['natrium'],
        kalium: json['kalium'],
        mangan: json['mangan'],
        tembaga: json['tembaga'],
        kromium: json['kromium'],
        besi: json['besi'],
        iodium: json['iodium'],
        seng: json['seng'],
        selenium: json['selenium'],
        fluor: json['fluor'],
      );
}
