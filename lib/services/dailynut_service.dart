import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:nutrimotion/models/daily_nutrition_model.dart';
import 'package:nutrimotion/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimotion/shared/shared_values.dart';
class DailynutService {
  Future<DailyNutritionModel> getUserDailyNutrition(DateTime date) async{
    try {
      // print('date: ' + date.toString());
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/get-user-daily-nutrition'),
        headers: {'Authorization': token},
        body: {'date_time': formattedDate}
      );
      if (res.statusCode == 200){
        final jsonData = jsonDecode(res.body);
        DailyNutritionModel data = DailyNutritionModel.fromJson(jsonData);
        return data;
      }else{
        throw Exception('Failed to get user daily nutrition ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get user daily nutrition data: ${e}');
    }
  }
}