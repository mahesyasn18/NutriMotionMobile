import 'dart:convert';

import 'package:nutrimotion/models/eaten_food_model.dart';
import 'package:nutrimotion/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimotion/shared/shared_values.dart';
class FoodService {

  Future<bool> addEatenFood(EatenFoodModel data) async{
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/add-eaten-food'),
        headers: {
          'Authorization': token,
        },
        body: data.toJson()
      );
      if(res.statusCode == 200) {
        return true;
      }else{
        throw Exception('Failed to add eaten food ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to add eaten food ${e}');
    }
  }

  Future<List<EatenFoodModel>> getUserEatenFood() async{
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/get-user-eaten-food'),
        headers: {'Authorization': token,},
      );
      if(res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);
        List<EatenFoodModel> userEatenFoodData = jsonData.map<EatenFoodModel>((item) {
          return EatenFoodModel.fromJson(item);
        }).toList();
        return userEatenFoodData;
        // return userEatenFoodData;
      }else{
        throw Exception('Failed to add eaten food ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get user eaten food data: ${e}');
    }
  }
}