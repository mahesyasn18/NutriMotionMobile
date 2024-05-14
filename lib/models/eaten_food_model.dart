import 'package:flutter/material.dart';

class EatenFoodModel{

  final String? foodName;
  final String? foodType;
  final String? foodCategory;
  final int? foodSize;
  final int? foodCalori;
  final int? foodCarb;
  final int? foodFat;
  final int? foodProtein;
  final TimeOfDay? eatTime;

  EatenFoodModel({
    this.foodName,
    this.foodType,
    this.foodCategory,
    this.foodSize,
    this.foodCalori,
    this.foodCarb,
    this.foodFat,
    this.foodProtein,
    this.eatTime,
  });

  String formatTimeOfDay(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0'); // Tambahkan nol di depan jika perlu
  final minute = time.minute.toString().padLeft(2, '0'); // Tambahkan nol di depan jika perlu

  return '$hour:$minute:00'; // Format HH:mm:ss
  }

  Map<String, dynamic> toJson(){
    final eatTimeString = formatTimeOfDay(eatTime!);
    return{
      'food_name': foodName,
      'food_type': foodType,
      'food_category': foodCategory,
      'size': foodSize.toString(),
      'kalori': foodCalori.toString(),
      'karbohidrat': foodCarb.toString(),
      'lemak_total': foodFat.toString(),
      'protein': foodProtein.toString(),
      'eat_time': eatTimeString,
    };
  }

  factory EatenFoodModel.fromJson(Map<String, dynamic> json) {
    List<String> parts = json['eat_time'].split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    return EatenFoodModel(
      foodName: json['food_name'],
      foodType: json['food_type'],
      foodCategory: json['food_category'],
      foodSize: json['size'],
      foodCalori: json['kalori'],
      foodCarb: json['karbohidrat'],
      foodFat: json['lemak_total'],
      foodProtein: json['protein'],
      eatTime: TimeOfDay(hour: hour, minute: minute),
    );
  }
  EatenFoodModel copyWith({int? dailyNutId}){
    return EatenFoodModel(

      foodName: foodName,
      foodType: foodType,
      foodCategory: foodCategory,
      foodSize: foodSize,
      foodCalori: foodCalori,
      foodCarb: foodCarb,
      foodFat: foodFat,
      foodProtein: foodProtein,
      eatTime: eatTime,
    );
  }
}