class ProfileUserEditFormModel {
  final String? fullname;
  final String? email;

  ProfileUserEditFormModel({
    this.fullname,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
    };
  }
}
