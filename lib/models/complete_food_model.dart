import 'package:flutter/material.dart';

class CompleteFoodModel {
  final int id;
  final String foodName;
  final String picture;
  final String foodType;
  final String foodCategory;
  final int size;
  final String? barcodeNumber;
  final TimeOfDay? eatTime;
  final DateTime? dateTime;
  final int? kalori;
  final int? lemaktTotal;
  final int? lemaktJenuh;
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

  CompleteFoodModel({
    required this.id,
    required this.foodName,
    required this.picture,
    required this.foodType,
    required this.foodCategory,
    required this.size,
    required this.kalori,
    required this.lemaktTotal,
    required this.protein,
    required this.karbohidratTotal,
    this.gula,
    this.serat,
    this.barcodeNumber,
    this.dateTime,
    this.eatTime,
    this.lemaktJenuh,
    this.garam,
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

  factory CompleteFoodModel.fromJson(Map<String, dynamic> json) {
    TimeOfDay? eatTime = null;
    DateTime? dateTime = null;
    if (json.containsKey('eat_time')) {
      List<String> parts = json['eat_time'].split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      eatTime = TimeOfDay(hour: hour, minute: minute);
    }
    if (json.containsKey('date_time')) {
      dateTime = DateTime.parse(json['date_time']);
    }
    return CompleteFoodModel(
      id: json['id'],
      foodName: json['food_name'],
      picture: json['picture'],
      foodType: json['food_type'],
      foodCategory: json['food_category'],
      size: json['size'],
      kalori: json['kalori'],
      lemaktTotal: json['lemak_total'],
      protein: json['protein'],
      karbohidratTotal: json['karbohidrat_total'],
      gula: json['gula'],
      serat: json['serat'],
      barcodeNumber: json['barcode_number'],
      eatTime: eatTime,
      dateTime: dateTime,
      lemaktJenuh: json['lemak_jenuh'],
      garam: json['garam'],
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
}
