class UserModel {
  final int? id;
  final String? fullname;
  final String? password;
  final String? email;
  final String? weight;
  final String? height;
  final String? gender;
  final String? birthday;
  final String? token;
  UserModel({
    this.id,
    this.fullname,
    this.password,
    this.email,
    this.weight,
    this.height,
    this.gender,
    this.birthday,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        fullname: json['fullname'],
        email: json['email'],
        weight: json['weight'].toString(),
        height: json['height'].toString(),
        gender: json['gender'],
        birthday: json['birthday'],
        token: json['token'],
      );

  UserModel copywith({
    String? fullname,
    String? password,
    String? email,
    String? weight,
    String? height,
    String? gender,
    String? birthday,
  }) =>
      UserModel(
        id: id,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        weight: weight ?? this.weight,
        password: password ?? this.password,
        height: height ?? this.height,
        gender: gender ?? this.gender,
        birthday: birthday ?? this.birthday,
        token: token,
      );
}
