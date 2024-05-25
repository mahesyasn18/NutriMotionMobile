class DailyNutritionModel {
  final int? calori;
  final int? carb;
  final int? protein;
  final int? fat;

  DailyNutritionModel({
    this.calori,
    this.carb,
    this.protein,
    this.fat,
  });


  factory DailyNutritionModel.fromJson(Map<String, dynamic> json){
    return DailyNutritionModel(
      calori: json['kalori'],
      carb: json['karbohidrat'],
      protein: json['protein'],
      fat: json['lemak'],
    );
  }
}

