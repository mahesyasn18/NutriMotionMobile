import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimotion/models/sign_in_form_model.dart';
import 'package:nutrimotion/models/sign_up_form_model.dart';
import 'package:nutrimotion/models/user_model.dart';
import 'package:nutrimotion/shared/shared_values.dart';

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/is-emaill-exist',
        ),
        body: {
          'email': email,
        },
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/registers'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copywith(
          email: data.email,
          password: data.password,
        );

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson(),
      );
      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copywith(
          email: data.email,
          password: data.password,
        );

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
      print(
          'email: ${user.email}\npassword: ${user.password}\ntoken: ${user.token}');
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        throw 'authenticated';
      } else {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer ' + value;
    }

    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
