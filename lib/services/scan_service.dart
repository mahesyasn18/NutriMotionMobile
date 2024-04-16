import 'package:http/http.dart' as http;
import 'package:nutrimotion/models/product_model.dart';
import 'package:nutrimotion/models/scans_model.dart';
import 'package:nutrimotion/services/auth_service.dart';
import 'package:nutrimotion/shared/shared_values.dart';
import 'dart:convert';

class ScanService {
  Future<ScansModel> checkBarcode(String barcode_number) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
          Uri.parse(
            '$baseUrl/check-food',
          ),
          body: {
            "barcode_number": barcode_number,
          },
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        print(res.body);
        return ScansModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to check barcode: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to check barcode: $e');
    }
  }

  Future<ProductModel> getProduct(String barcode_number) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
          Uri.parse(
            '$baseUrl/show-food',
          ),
          body: {
            "barcode_number": barcode_number,
          },
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        print(res.body);
        return ProductModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to check barcode: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to check barcode: $e');
    }
  }
}
