import 'dart:convert';
import 'package:nutrimotion/models/complete_food_model.dart';
import 'package:nutrimotion/models/eaten_food_model.dart';
import 'package:nutrimotion/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimotion/shared/shared_values.dart';

class FoodService {
  Future<bool> addEatenFood(EatenFoodModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(Uri.parse('$baseUrl/add-eaten-food'),
          headers: {
            'Authorization': token,
          },
          body: data.toJson());
      if (res.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to add eaten food ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to add eaten food ${e}');
    }
  }

  Future<List<EatenFoodModel>> getUserEatenFood() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/get-user-eaten-food'),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);
        List<EatenFoodModel> userEatenFoodData =
            jsonData.map<EatenFoodModel>((item) {
          return EatenFoodModel.fromJson(item);
        }).toList();
        return userEatenFoodData;
        // return userEatenFoodData;
      } else {
        throw Exception('Failed to get eaten food ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get user eaten food data: ${e}');
    }
  }

  Future<List<CompleteFoodModel>> getAllFood() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/get-all-food'),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);
        print(jsonData);
        List<CompleteFoodModel> foodList =
            jsonData.map<CompleteFoodModel>((item) {
          return CompleteFoodModel.fromJson(item);
        }).toList();
        return foodList;
        // return userEatenFoodData;
      } else {
        throw Exception('Failed to get all food data ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get all food data: ${e}');
    }
  }

  Future<List<CompleteFoodModel>> getUserHistoryFood() async {
    try {
      print('dicobain');
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/get-user-history-food'),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);
        List<CompleteFoodModel> foodList =
            jsonData.map<CompleteFoodModel>((item) {
          return CompleteFoodModel.fromJson(item);
        }).toList();
        return foodList;
        // return userEatenFoodData;
      } else {
        throw Exception('Failed to get all food data ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get all food data: ${e}');
    }
  }
}
