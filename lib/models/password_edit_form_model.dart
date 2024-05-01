class PasswordEditFormModel {
  final String? current_password;
  final String? password;
  final String? password_confirmation;

  PasswordEditFormModel({
    this.current_password,
    this.password,
    this.password_confirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'current_password': current_password,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }
}
