part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpFormModel data;
  const AuthRegister(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInFormModel data;
  const AuthLogin(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class AuthLogout extends AuthEvent {}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final ProfileUserEditFormModel data;
  const AuthUpdateUser(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class AuthUpdatePersonalDataUser extends AuthEvent {
  final ProfileDataPersonalEditFormModel data;
  const AuthUpdatePersonalDataUser(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class AuthUpdatePasswordUser extends AuthEvent {
  final PasswordEditFormModel data;
  const AuthUpdatePasswordUser(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
