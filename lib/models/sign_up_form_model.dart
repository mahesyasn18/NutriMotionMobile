class SignUpFormModel {
  final String? fullname;
  final String? email;
  final String? password;
  final String? gender;
  final String? birthday;
  final String? height;
  final String? weight;

  SignUpFormModel({
    this.fullname,
    this.email,
    this.password,
    this.gender,
    this.birthday,
    this.height,
    this.weight,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
      'gender': gender,
      'birthday': birthday,
      'height': height,
      'weight': weight
    };
  }

  SignUpFormModel copyWith({
    String? gender,
    String? birthday,
    String? height,
    String? weight,
  }) =>
      SignUpFormModel(
        fullname: fullname,
        email: email,
        password: password,
        gender: gender ?? this.gender,
        birthday: birthday ?? this.birthday,
        height: height ?? this.height,
        weight: weight ?? this.birthday,
      );
}
