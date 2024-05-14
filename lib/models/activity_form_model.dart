class ActivityFormModel {
  final String? activity_name;

  ActivityFormModel({
    this.activity_name,
  });
  Map<String, dynamic> toJson() {
    return {
      'activity_name': activity_name,
    };
  }
}
