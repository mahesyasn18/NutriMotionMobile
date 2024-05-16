class SetGoalFormModel {
  final String kalori;

  SetGoalFormModel({
    required this.kalori,
  });
  Map<String, dynamic> toJson() {
    return {
      'kalori': kalori,
    };
  }
}
