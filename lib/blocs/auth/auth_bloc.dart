import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/data_personal_edit_form_model.dart';
import 'package:nutrimotion/models/password_edit_form_model.dart';
import 'package:nutrimotion/models/profille_edit_form_model.dart';
import 'package:nutrimotion/models/sign_in_form_model.dart';
import 'package:nutrimotion/models/sign_up_form_model.dart';
import 'package:nutrimotion/models/user_model.dart';
import 'package:nutrimotion/services/auth_service.dart';
import 'package:nutrimotion/services/user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final res = await AuthService().checkEmail(event.email);
          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah terpakai!'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await AuthService().login(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());

          final SignInFormModel data =
              await AuthService().getCredentialFromLocal();

          final UserModel user = await AuthService().login(data);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogout) {
        try {
          emit(AuthLoading());
          await AuthService().logout();

          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updateUser = (state as AuthSuccess).user.copywith(
                  fullname: event.data.fullname,
                  email: event.data.email,
                );

            emit(AuthLoading());

            // Panggil UserService untuk mengirim pembaruan ke server
            await UserService().updateUser(event.data);
            emit(AuthSuccess(updateUser));
            // Panggil AuthService untuk memperbarui email di penyimpanan lokal
            await AuthService().updateEmailInLocal(event.data.email.toString());
          } else {
            print("gagal");
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdatePersonalDataUser) {
        try {
          if (state is AuthSuccess) {
            final updateUser = (state as AuthSuccess).user.copywith(
                  gender: event.data.gender,
                  birthday: event.data.birthday,
                  height: event.data.height,
                  weight: event.data.weight,
                );

            emit(AuthLoading());
            await UserService().updateDataPersonalUser(event.data);
            emit(AuthSuccess(updateUser));
          } else {
            print("gagal");
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdatePasswordUser) {
        try {
          if (state is AuthSuccess) {
            final updateUser = (state as AuthSuccess).user.copywith(
                  password: event.data.password,
                );

            emit(AuthLoading());

            // Panggil UserService untuk mengirim pembaruan ke server
            await UserService().updatePasswordUser(event.data);
            emit(AuthSuccess(updateUser));
            // Panggil AuthService untuk memperbarui email di penyimpanan lokal
            await AuthService()
                .updatePasswordInLocal(event.data.password.toString());
          } else {
            print("gagal");
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
