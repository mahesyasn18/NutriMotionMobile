import 'package:http/http.dart' as http;
import 'package:nutrimotion/models/activity_detail_form_model.dart';
import 'package:nutrimotion/models/activity_form_model.dart';
import 'package:nutrimotion/models/activity_model.dart';
import 'package:nutrimotion/models/calory_model.dart';
import 'package:nutrimotion/models/detail_activity_model.dart';
import 'package:nutrimotion/models/goal_model.dart';
import 'package:nutrimotion/models/set_goal_form_model.dart';
import 'package:nutrimotion/services/auth_service.dart';
import 'package:nutrimotion/shared/shared_values.dart';
import 'dart:convert';

class ActivityService {
  Future<List<ActivityModel>> getActivity() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
          Uri.parse(
            '$baseUrl/get-activity',
          ),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        final List<ActivityModel> activities =
            data.map((json) => ActivityModel.fromJson(json)).toList();
        return activities;
      } else {
        throw Exception('Failed to get Activity: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get Activity: $e');
    }
  }

  Future<ActivityModel> showActivity(ActivityFormModel activityForm) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/detail/activity'),
        body: activityForm.toJson(),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        return ActivityModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to get Activity: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get Activity: $e');
    }
  }

  Future<GoalModel> getUserGoal() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/user/set-goal/show'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        return GoalModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to get user goal: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get user goal: $e');
    }
  }

  Future<CaloryModel> getCallories() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/user/calory'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        return CaloryModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to get user callories used: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get user callories used: $e');
    }
  }

  Future<GoalModel> setUserGoal(SetGoalFormModel setGoalFormModel) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/user/set-goal'),
        body: setGoalFormModel.toJson(),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        return GoalModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to sets Activity: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to setssd Activity: $e');
    }
  }

  Future<List<DetailActivityModel>> getDetailActivity() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
          Uri.parse(
            '$baseUrl/user/all-activity',
          ),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        final List<DetailActivityModel> activities =
            data.map((json) => DetailActivityModel.fromJson(json)).toList();
        return activities;
      } else {
        throw Exception('Failed to get Detail Activity: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get Detail Activity: $e');
    }
  }

  Future<DetailActivityModel> setDetailActivity(
      ActivityDetailFormModel activityDetailFormModel) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/user/store-activity'),
        body: activityDetailFormModel.toJson(),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        return DetailActivityModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to create Activity: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Semua Field harus diisi!');
    }
  }
}
