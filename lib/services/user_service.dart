import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nutrimotion/models/data_personal_edit_form_model.dart';
import 'package:nutrimotion/models/password_edit_form_model.dart';
import 'package:nutrimotion/models/profille_edit_form_model.dart';
import 'package:nutrimotion/services/auth_service.dart';
import 'package:nutrimotion/shared/shared_values.dart';

class UserService {
  Future<void> updateUser(ProfileUserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse(
          '$baseUrl/update-profile',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDataPersonalUser(
      ProfileDataPersonalEditFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse(
          '$baseUrl/update-personal-data',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePasswordUser(PasswordEditFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse(
          '$baseUrl/update-password',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
