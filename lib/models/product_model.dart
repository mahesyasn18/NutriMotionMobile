class ProductModel {
  final int? id;
  final String? brand;
  final String? foodName;
  final String? picture;
  final String? foodType;
  final String? foodCategory;
  final String? size;
  final String? barcodeNumber;
  final int? kalori;
  final int? lemakTotal;
  final int? lemakJenuh;
  final int? protein;
  final int? karbohidratTotal;
  final int? gula;
  final int? garam;
  final int? serat;
  final int? vitA;
  final int? vitD;
  final int? vitE;
  final int? vitK;
  final int? vitB1;
  final int? vitB2;
  final int? vitB3;
  final int? vitB5;
  final int? vitB6;
  final int? folat;
  final int? vitB12;
  final int? biotin;
  final int? kolin;
  final int? vitC;
  final int? kalsium;
  final int? fosfor;
  final int? magnesium;
  final int? natrium;
  final int? kalium;
  final int? mangan;
  final int? tembaga;
  final int? kromium;
  final int? besi;
  final int? iodium;
  final int? seng;
  final int? selenium;
  final int? fluor;

  ProductModel({
    this.id,
    this.brand,
    this.foodName,
    this.picture,
    this.foodType,
    this.foodCategory,
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
        picture: json['picture'],
        foodType: json['food_type'],
        foodCategory: json['food_category'],
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
