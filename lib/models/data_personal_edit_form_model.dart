class ProfileDataPersonalEditFormModel {
  final String? gender;
  final String? birthday;
  final String? height;
  final String? weight;

  ProfileDataPersonalEditFormModel({
    this.gender,
    this.birthday,
    this.height,
    this.weight,
  });

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'birthday': birthday,
      'height': height,
      'weight': weight,
    };
  }
}
