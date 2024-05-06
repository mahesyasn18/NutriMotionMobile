import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:nutrimotion/models/water_model.dart';
import 'package:nutrimotion/services/auth_service.dart';
import 'package:nutrimotion/shared/shared_values.dart';

class WaterService {
  Future<WaterModel> getWater() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/check-water'),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        final jsonData = json.decode(res.body);
        final waterModel = WaterModel(using_water: jsonData['using_water']);
        return waterModel;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<WaterModel> drinkWater() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/drink-water'),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        final jsonData = json.decode(res.body);
        final waterModel = WaterModel(using_water: jsonData['using_water']);
        return waterModel;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
